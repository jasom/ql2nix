
{ buildLispPackage, stdenv, fetchurl, lisp-project_hh-redblack, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "hh-redblack";
      
      sourceProject = "${lisp-project_hh-redblack}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_hh-redblack-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
