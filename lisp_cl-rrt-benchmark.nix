
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-rrt, 
   lisp_cl-rrt, lisp_cl-rrt-rtree, lisp_cl-rrt-test, lisp_fiveam, lisp_vecto,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-rrt lisp_cl-rrt-rtree lisp_cl-rrt-test lisp_fiveam lisp_vecto  ];
      inherit stdenv;
      systemName = "cl-rrt.benchmark";
      
      sourceProject = "${lisp-project_cl-rrt}";
      patches = [];
      lisp_dependencies = "${lisp_cl-rrt} ${lisp_cl-rrt-rtree} ${lisp_cl-rrt-test} ${lisp_fiveam} ${lisp_vecto}";
      name = "lisp_cl-rrt-benchmark-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
