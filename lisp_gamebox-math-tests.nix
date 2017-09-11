
{ buildLispPackage, stdenv, fetchurl, lisp-project_gamebox-math, 
   lisp_gamebox-math, lisp_prove, lisp_prove-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_gamebox-math lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "gamebox-math.tests";
      
      sourceProject = "${lisp-project_gamebox-math}";
      patches = [];
      lisp_dependencies = "${lisp_gamebox-math} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_gamebox-math-tests-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
