
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-rrt, 
   lisp_alexandria, lisp_anaphora, lisp_cl-rrt, lisp_cl-syntax-annot, lisp_iterate, lisp_optima, lisp_spatial-trees, lisp_spatial-trees-nns,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_anaphora lisp_cl-rrt lisp_cl-syntax-annot lisp_iterate lisp_optima lisp_spatial-trees lisp_spatial-trees-nns  ];
      inherit stdenv;
      systemName = "cl-rrt.rtree";
      
      sourceProject = "${lisp-project_cl-rrt}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_anaphora} ${lisp_cl-rrt} ${lisp_cl-syntax-annot} ${lisp_iterate} ${lisp_optima} ${lisp_spatial-trees} ${lisp_spatial-trees-nns}";
      name = "lisp_cl-rrt-rtree-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
