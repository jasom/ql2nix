
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cffi-gtk, 
  glib,   lisp_cffi, lisp_iterate, lisp_trivial-features,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_iterate lisp_trivial-features glib ];
      inherit stdenv;
      systemName = "cl-cffi-gtk-glib";
      
      sourceProject = "${lisp-project_cl-cffi-gtk}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_iterate} ${lisp_trivial-features}";
      name = "lisp_cl-cffi-gtk-glib-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
