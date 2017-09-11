
{ buildLispPackage, stdenv, fetchurl, lisp-project_sapaclisp, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "sapaclisp";
      
      sourceProject = "${lisp-project_sapaclisp}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_sapaclisp-1.0a";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
