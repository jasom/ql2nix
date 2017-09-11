
{ buildLispPackage, stdenv, fetchurl, lisp-project_marching-cubes, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "marching-cubes";
      
      sourceProject = "${lisp-project_marching-cubes}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_marching-cubes-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
