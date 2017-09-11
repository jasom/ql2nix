
{ buildLispPackage, stdenv, fetchurl, lisp-project_gtk-cffi, 
  glib,   lisp_cffi-objects, lisp_gtk-cffi-utils, lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi-objects lisp_gtk-cffi-utils lisp_iterate glib ];
      inherit stdenv;
      systemName = "g-lib-cffi";
      
      sourceProject = "${lisp-project_gtk-cffi}";
      patches = [];
      lisp_dependencies = "${lisp_cffi-objects} ${lisp_gtk-cffi-utils} ${lisp_iterate}";
      name = "lisp_g-lib-cffi-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
