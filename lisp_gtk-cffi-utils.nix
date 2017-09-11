
{ buildLispPackage, stdenv, fetchurl, lisp-project_gtk-cffi, 
   lisp_alexandria, lisp_cffi, lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cffi lisp_iterate  ];
      inherit stdenv;
      systemName = "gtk-cffi-utils";
      
      sourceProject = "${lisp-project_gtk-cffi}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cffi} ${lisp_iterate}";
      name = "lisp_gtk-cffi-utils-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
