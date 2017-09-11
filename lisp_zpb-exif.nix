
{ buildLispPackage, stdenv, fetchurl, lisp-project_zpb-exif, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "zpb-exif";
      
      sourceProject = "${lisp-project_zpb-exif}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_zpb-exif-1.2.3";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
