
{ buildLispPackage, stdenv, fetchurl, lisp-project_common-doc-plump, 
   lisp_cl-markup, lisp_plump, lisp_common-doc-split-paragraphs, lisp_common-doc,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-markup lisp_plump lisp_common-doc-split-paragraphs lisp_common-doc  ];
      inherit stdenv;
      systemName = "common-doc-plump";
      
      sourceProject = "${lisp-project_common-doc-plump}";
      patches = [];
      lisp_dependencies = "${lisp_cl-markup} ${lisp_plump} ${lisp_common-doc-split-paragraphs} ${lisp_common-doc}";
      name = "lisp_common-doc-plump-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
