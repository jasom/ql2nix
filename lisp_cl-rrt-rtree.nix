
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-rrt, 
   lisp_spatial-trees-nns, lisp_spatial-trees, lisp_optima, lisp_anaphora, lisp_cl-syntax-annot, lisp_alexandria, lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_spatial-trees-nns lisp_spatial-trees lisp_optima lisp_anaphora lisp_cl-syntax-annot lisp_alexandria lisp_iterate  ];
      inherit stdenv;
      systemName = "cl-rrt.rtree";
      
      sourceProject = "${lisp-project_cl-rrt}";
      patches = [];
      lisp_dependencies = "${lisp_spatial-trees-nns} ${lisp_spatial-trees} ${lisp_optima} ${lisp_anaphora} ${lisp_cl-syntax-annot} ${lisp_alexandria} ${lisp_iterate}";
      name = "lisp_cl-rrt-rtree-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
