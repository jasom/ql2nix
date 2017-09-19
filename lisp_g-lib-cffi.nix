
{ buildLispPackage, stdenv, fetchurl, lisp-project_gtk-cffi, 
  glib,   lisp_iterate, lisp_cffi-objects,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate lisp_cffi-objects glib ];
      inherit stdenv;
      systemName = "g-lib-cffi";
      
      sourceProject = "${lisp-project_gtk-cffi}";
      patches = [];
      lisp_dependencies = "${lisp_iterate} ${lisp_cffi-objects}";
      name = "lisp_g-lib-cffi-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
