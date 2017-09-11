
{ buildLispPackage, stdenv, fetchurl, lisp-project_cells, 
   lisp_cells,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cells  ];
      inherit stdenv;
      systemName = "cells-test";
      
      sourceProject = "${lisp-project_cells}";
      patches = [];
      lisp_dependencies = "${lisp_cells}";
      name = "lisp_cells-test-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
