
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-voxelize, 
   lisp_cl-voxelize, lisp_prove, lisp_prove-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-voxelize lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "cl-voxelize-test";
      
      sourceProject = "${lisp-project_cl-voxelize}";
      patches = [];
      lisp_dependencies = "${lisp_cl-voxelize} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_cl-voxelize-test-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
