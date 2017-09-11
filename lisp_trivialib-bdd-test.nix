
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivialib-bdd, 
   lisp_fiveam, lisp_trivialib-bdd,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_trivialib-bdd  ];
      inherit stdenv;
      systemName = "trivialib.bdd.test";
      
      sourceProject = "${lisp-project_trivialib-bdd}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_trivialib-bdd}";
      name = "lisp_trivialib-bdd-test-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
