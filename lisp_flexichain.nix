
{ buildLispPackage, stdenv, fetchurl, lisp-project_flexichain, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "flexichain";
      
      sourceProject = "${lisp-project_flexichain}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_flexichain_1.5.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
