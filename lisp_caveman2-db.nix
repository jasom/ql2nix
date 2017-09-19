
{ buildLispPackage, stdenv, fetchurl, lisp-project_caveman, 
   lisp_sxql, lisp_dbi, lisp_clack-v1-compat,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_sxql lisp_dbi lisp_clack-v1-compat  ];
      inherit stdenv;
      systemName = "caveman2-db";
      
      sourceProject = "${lisp-project_caveman}";
      patches = [];
      lisp_dependencies = "${lisp_sxql} ${lisp_dbi} ${lisp_clack-v1-compat}";
      name = "lisp_caveman2-db-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
