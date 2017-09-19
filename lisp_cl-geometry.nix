
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-geometry, 
   lisp_trees, lisp_iterate,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trees lisp_iterate  ];
      inherit stdenv;
      systemName = "cl-geometry";
      
      sourceProject = "${lisp-project_cl-geometry}";
      patches = [];
      lisp_dependencies = "${lisp_trees} ${lisp_iterate}";
      name = "lisp_cl-geometry-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
