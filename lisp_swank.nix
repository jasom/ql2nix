
{ buildLispPackage, stdenv, fetchurl, lisp-project_slime, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "swank";
      NoBundle = 1;
      sourceProject = "${lisp-project_slime}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_swank-v2.20";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
