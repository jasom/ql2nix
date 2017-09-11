
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cffi-gtk, 
  gnome3,   lisp_cffi, lisp_cl-cffi-gtk-cairo, lisp_cl-cffi-gtk-gdk-pixbuf, lisp_cl-cffi-gtk-gio, lisp_cl-cffi-gtk-glib, lisp_cl-cffi-gtk-gobject, lisp_cl-cffi-gtk-pango,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_cl-cffi-gtk-cairo lisp_cl-cffi-gtk-gdk-pixbuf lisp_cl-cffi-gtk-gio lisp_cl-cffi-gtk-glib lisp_cl-cffi-gtk-gobject lisp_cl-cffi-gtk-pango gnome3.gtk ];
      inherit stdenv;
      systemName = "cl-cffi-gtk-gdk";
      
      sourceProject = "${lisp-project_cl-cffi-gtk}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_cl-cffi-gtk-cairo} ${lisp_cl-cffi-gtk-gdk-pixbuf} ${lisp_cl-cffi-gtk-gio} ${lisp_cl-cffi-gtk-glib} ${lisp_cl-cffi-gtk-gobject} ${lisp_cl-cffi-gtk-pango}";
      name = "lisp_cl-cffi-gtk-gdk-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
