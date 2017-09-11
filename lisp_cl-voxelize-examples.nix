
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-voxelize, 
   lisp_cl-ply, lisp_cl-voxelize,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ply lisp_cl-voxelize  ];
      inherit stdenv;
      systemName = "cl-voxelize-examples";
      
      sourceProject = "${lisp-project_cl-voxelize}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ply} ${lisp_cl-voxelize}";
      name = "lisp_cl-voxelize-examples-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
