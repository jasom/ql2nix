
{ buildLispPackage, stdenv, fetchurl, lisp-project_tap-unit-test, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "tap-unit-test";
      
      sourceProject = "${lisp-project_tap-unit-test}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_tap-unit-test-20111105-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
