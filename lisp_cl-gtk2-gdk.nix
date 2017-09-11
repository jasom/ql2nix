
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-gtk2, 
  gnome2,   lisp_cffi, lisp_cl-gtk2-glib, lisp_cl-gtk2-pango,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_cl-gtk2-glib lisp_cl-gtk2-pango gnome2.gtk ];
      inherit stdenv;
      systemName = "cl-gtk2-gdk";
      
      sourceProject = "${lisp-project_cl-gtk2}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_cl-gtk2-glib} ${lisp_cl-gtk2-pango}";
      name = "lisp_cl-gtk2-gdk-20120909-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
