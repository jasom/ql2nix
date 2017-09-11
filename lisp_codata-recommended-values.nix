
{ buildLispPackage, stdenv, fetchurl, lisp-project_codata-recommended-values, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "codata-recommended-values";
      
      sourceProject = "${lisp-project_codata-recommended-values}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_codata-recommended-values-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
