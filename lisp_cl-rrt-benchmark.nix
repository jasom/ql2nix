
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-rrt, 
   lisp_vecto, lisp_fiveam, lisp_spatial-trees-nns, lisp_spatial-trees, lisp_optima, lisp_anaphora, lisp_cl-syntax-annot, lisp_alexandria, lisp_iterate,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_vecto lisp_fiveam lisp_spatial-trees-nns lisp_spatial-trees lisp_optima lisp_anaphora lisp_cl-syntax-annot lisp_alexandria lisp_iterate  ];
      inherit stdenv;
      systemName = "cl-rrt.benchmark";
      
      sourceProject = "${lisp-project_cl-rrt}";
      patches = [];
      lisp_dependencies = "${lisp_vecto} ${lisp_fiveam} ${lisp_spatial-trees-nns} ${lisp_spatial-trees} ${lisp_optima} ${lisp_anaphora} ${lisp_cl-syntax-annot} ${lisp_alexandria} ${lisp_iterate}";
      name = "lisp_cl-rrt-benchmark-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
