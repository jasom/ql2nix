
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-annot-prove, 
   lisp_cl-annot-prove, lisp_prove, lisp_prove-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-annot-prove lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "cl-annot-prove-test";
      
      sourceProject = "${lisp-project_cl-annot-prove}";
      patches = [];
      lisp_dependencies = "${lisp_cl-annot-prove} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_cl-annot-prove-test-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
