
{ buildLispPackage, stdenv, fetchurl, lisp-project_zpb-ttf, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "zpb-ttf";
      
      sourceProject = "${lisp-project_zpb-ttf}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_zpb-ttf-1.0.3";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
