
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-with, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "trivial-with";
      
      sourceProject = "${lisp-project_trivial-with}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_trivial-with-quicklisp-2fd8ca54-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
