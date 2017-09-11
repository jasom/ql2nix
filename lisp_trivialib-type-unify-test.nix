
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivialib-type-unify, 
   lisp_fiveam, lisp_trivialib-type-unify,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_trivialib-type-unify  ];
      inherit stdenv;
      systemName = "trivialib.type-unify.test";
      
      sourceProject = "${lisp-project_trivialib-type-unify}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_trivialib-type-unify}";
      name = "lisp_trivialib-type-unify-test-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
