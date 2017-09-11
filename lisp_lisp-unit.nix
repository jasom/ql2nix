
{ buildLispPackage, stdenv, fetchurl, lisp-project_lisp-unit, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "lisp-unit";
      
      sourceProject = "${lisp-project_lisp-unit}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_lisp-unit-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
