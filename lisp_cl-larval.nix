
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-larval, 
   lisp_swank, lisp_cl-package-locks, lisp_alexandria, lisp_cl-curlex, lisp_rutils, lisp_cl-interpol, lisp_iterate,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_swank lisp_cl-package-locks lisp_alexandria lisp_cl-curlex lisp_rutils lisp_cl-interpol lisp_iterate  ];
      inherit stdenv;
      systemName = "cl-larval";
      
      sourceProject = "${lisp-project_cl-larval}";
      patches = [];
      lisp_dependencies = "${lisp_swank} ${lisp_cl-package-locks} ${lisp_alexandria} ${lisp_cl-curlex} ${lisp_rutils} ${lisp_cl-interpol} ${lisp_iterate}";
      name = "lisp_cl-larval-20140826-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
