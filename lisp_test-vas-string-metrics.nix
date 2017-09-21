
{ buildLispPackage, stdenv, fetchurl, lisp-project_vas-string-metrics, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "test.vas-string-metrics";
      
      sourceProject = "${lisp-project_vas-string-metrics}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_test-vas-string-metrics-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }