
{ buildLispPackage, stdenv, fetchurl, lisp-project_acclimation, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "acclimation-temperature";
      
      sourceProject = "${lisp-project_acclimation}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_acclimation-temperature-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
