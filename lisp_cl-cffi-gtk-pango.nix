
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cffi-gtk, 
  pango,   lisp_cl-cffi-gtk-cairo, lisp_cl-cffi-gtk-glib, lisp_cl-cffi-gtk-gobject, lisp_iterate,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-cffi-gtk-cairo lisp_cl-cffi-gtk-glib lisp_cl-cffi-gtk-gobject lisp_iterate pango ];
      inherit stdenv;
      systemName = "cl-cffi-gtk-pango";
      
      sourceProject = "${lisp-project_cl-cffi-gtk}";
      patches = [];
      lisp_dependencies = "${lisp_cl-cffi-gtk-cairo} ${lisp_cl-cffi-gtk-glib} ${lisp_cl-cffi-gtk-gobject} ${lisp_iterate}";
      name = "lisp_cl-cffi-gtk-pango-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
