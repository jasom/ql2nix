
{ buildLispPackage, stdenv, fetchurl, lisp-project_dendrite, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "dendrite.micro-l-system";
      
      sourceProject = "${lisp-project_dendrite}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_dendrite-micro-l-system-release-quicklisp-662aedba-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
