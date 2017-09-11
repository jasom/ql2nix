
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cffi-gtk, 
   lisp_bordeaux-threads, lisp_cffi, lisp_cl-cffi-gtk-cairo, lisp_cl-cffi-gtk-gdk, lisp_cl-cffi-gtk-gdk-pixbuf, lisp_cl-cffi-gtk-gio, lisp_cl-cffi-gtk-glib, lisp_cl-cffi-gtk-gobject, lisp_cl-cffi-gtk-pango, lisp_iterate, lisp_trivial-features,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_cffi lisp_cl-cffi-gtk-cairo lisp_cl-cffi-gtk-gdk lisp_cl-cffi-gtk-gdk-pixbuf lisp_cl-cffi-gtk-gio lisp_cl-cffi-gtk-glib lisp_cl-cffi-gtk-gobject lisp_cl-cffi-gtk-pango lisp_iterate lisp_trivial-features  ];
      inherit stdenv;
      systemName = "cl-cffi-gtk";
      
      sourceProject = "${lisp-project_cl-cffi-gtk}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_cffi} ${lisp_cl-cffi-gtk-cairo} ${lisp_cl-cffi-gtk-gdk} ${lisp_cl-cffi-gtk-gdk-pixbuf} ${lisp_cl-cffi-gtk-gio} ${lisp_cl-cffi-gtk-glib} ${lisp_cl-cffi-gtk-gobject} ${lisp_cl-cffi-gtk-pango} ${lisp_iterate} ${lisp_trivial-features}";
      name = "lisp_cl-cffi-gtk-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
