
{ buildLispPackage, stdenv, fetchurl, lisp-project_fare-memoization, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "fare-memoization";
      
      sourceProject = "${lisp-project_fare-memoization}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_fare-memoization-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
