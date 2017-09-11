
{ buildLispPackage, stdenv, fetchurl, lisp-project_x-fdatatypes, 
   
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "x.fdatatypes";
      
      sourceProject = "${lisp-project_x-fdatatypes}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_x-fdatatypes-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
