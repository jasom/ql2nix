
{ buildLispPackage, stdenv, fetchurl, lisp-project_common-doc-plump, 
   lisp_anaphora, lisp_cl-markup, lisp_common-doc, lisp_common-doc-split-paragraphs, lisp_plump,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_anaphora lisp_cl-markup lisp_common-doc lisp_common-doc-split-paragraphs lisp_plump  ];
      inherit stdenv;
      systemName = "common-doc-plump";
      
      sourceProject = "${lisp-project_common-doc-plump}";
      patches = [];
      lisp_dependencies = "${lisp_anaphora} ${lisp_cl-markup} ${lisp_common-doc} ${lisp_common-doc-split-paragraphs} ${lisp_plump}";
      name = "lisp_common-doc-plump-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
