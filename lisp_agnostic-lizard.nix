
{ buildLispPackage, stdenv, fetchurl, lisp-project_agnostic-lizard, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "agnostic-lizard";
      
      sourceProject = "${lisp-project_agnostic-lizard}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_agnostic-lizard-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
