
{ buildLispPackage, stdenv, fetchurl, lisp-project_bordeaux-fft, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "bordeaux-fft";
      
      sourceProject = "${lisp-project_bordeaux-fft}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_bordeaux-fft-20150608-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
