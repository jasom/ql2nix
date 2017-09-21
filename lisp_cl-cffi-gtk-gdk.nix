
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cffi-gtk, 
  glib, gdk_pixbuf, cairo, pango, gnome3,   lisp_closer-mop, lisp_bordeaux-threads, lisp_trivial-garbage, lisp_iterate, lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_bordeaux-threads lisp_trivial-garbage lisp_iterate lisp_cffi glib gdk_pixbuf cairo pango gnome3.gtk ];
      inherit stdenv;
      systemName = "cl-cffi-gtk-gdk";
      
      sourceProject = "${lisp-project_cl-cffi-gtk}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_bordeaux-threads} ${lisp_trivial-garbage} ${lisp_iterate} ${lisp_cffi}";
      name = "lisp_cl-cffi-gtk-gdk-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }