
{ buildLispPackage, stdenv, fetchurl, lisp-project_bourbaki, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "bourbaki";
      
      sourceProject = "${lisp-project_bourbaki}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_bourbaki-20110110-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }