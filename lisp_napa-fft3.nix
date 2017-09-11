
{ buildLispPackage, stdenv, fetchurl, lisp-project_napa-fft3, 
   
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "napa-fft3";
      
      sourceProject = "${lisp-project_napa-fft3}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_napa-fft3-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
