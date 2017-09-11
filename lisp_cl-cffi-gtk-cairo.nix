
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cffi-gtk, 
  cairo,   lisp_cffi, lisp_cl-cffi-gtk-glib, lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_cl-cffi-gtk-glib lisp_iterate cairo ];
      inherit stdenv;
      systemName = "cl-cffi-gtk-cairo";
      
      sourceProject = "${lisp-project_cl-cffi-gtk}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_cl-cffi-gtk-glib} ${lisp_iterate}";
      name = "lisp_cl-cffi-gtk-cairo-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
