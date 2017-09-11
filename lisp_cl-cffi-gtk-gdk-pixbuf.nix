
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cffi-gtk, 
  gdk_pixbuf,   lisp_cffi, lisp_cl-cffi-gtk-glib, lisp_cl-cffi-gtk-gobject,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_cl-cffi-gtk-glib lisp_cl-cffi-gtk-gobject gdk_pixbuf ];
      inherit stdenv;
      systemName = "cl-cffi-gtk-gdk-pixbuf";
      
      sourceProject = "${lisp-project_cl-cffi-gtk}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_cl-cffi-gtk-glib} ${lisp_cl-cffi-gtk-gobject}";
      name = "lisp_cl-cffi-gtk-gdk-pixbuf-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
