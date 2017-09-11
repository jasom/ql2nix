
{ buildLispPackage, stdenv, fetchurl, lisp-project_cells, 
   lisp_utils-kt,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_utils-kt  ];
      inherit stdenv;
      systemName = "cells";
      
      sourceProject = "${lisp-project_cells}";
      patches = [];
      lisp_dependencies = "${lisp_utils-kt}";
      name = "lisp_cells-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
