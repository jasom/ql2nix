
{ buildLispPackage, stdenv, fetchurl, lisp-project_let-over-lambda, 
   lisp_let-over-lambda, lisp_named-readtables, lisp_prove, lisp_prove-asdf,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_let-over-lambda lisp_named-readtables lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "let-over-lambda-test";
      
      sourceProject = "${lisp-project_let-over-lambda}";
      patches = [];
      lisp_dependencies = "${lisp_let-over-lambda} ${lisp_named-readtables} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_let-over-lambda-test-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
