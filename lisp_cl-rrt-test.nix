
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-rrt, 
   lisp_cl-rrt, lisp_cl-rrt-rtree, lisp_fiveam, lisp_vecto,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-rrt lisp_cl-rrt-rtree lisp_fiveam lisp_vecto  ];
      inherit stdenv;
      systemName = "cl-rrt.test";
      
      sourceProject = "${lisp-project_cl-rrt}";
      patches = [];
      lisp_dependencies = "${lisp_cl-rrt} ${lisp_cl-rrt-rtree} ${lisp_fiveam} ${lisp_vecto}";
      name = "lisp_cl-rrt-test-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
