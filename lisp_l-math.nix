
{ buildLispPackage, stdenv, fetchurl, lisp-project_l-math, 
   
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "l-math";
      
      sourceProject = "${lisp-project_l-math}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_l-math-20131111-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
