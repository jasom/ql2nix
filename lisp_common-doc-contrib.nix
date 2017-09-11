
{ buildLispPackage, stdenv, fetchurl, lisp-project_common-doc, 
   lisp_common-doc-gnuplot, lisp_common-doc-graphviz, lisp_common-doc-include, lisp_common-doc-split-paragraphs, lisp_common-doc-tex,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_common-doc-gnuplot lisp_common-doc-graphviz lisp_common-doc-include lisp_common-doc-split-paragraphs lisp_common-doc-tex  ];
      inherit stdenv;
      systemName = "common-doc-contrib";
      
      sourceProject = "${lisp-project_common-doc}";
      patches = [];
      lisp_dependencies = "${lisp_common-doc-gnuplot} ${lisp_common-doc-graphviz} ${lisp_common-doc-include} ${lisp_common-doc-split-paragraphs} ${lisp_common-doc-tex}";
      name = "lisp_common-doc-contrib-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
