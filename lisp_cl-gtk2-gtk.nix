
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-gtk2, 
   lisp_bordeaux-threads, lisp_cffi, lisp_cl-gtk2-gdk, lisp_cl-gtk2-glib, lisp_cl-gtk2-pango, lisp_iterate,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_cffi lisp_cl-gtk2-gdk lisp_cl-gtk2-glib lisp_cl-gtk2-pango lisp_iterate  ];
      inherit stdenv;
      systemName = "cl-gtk2-gtk";
      
      sourceProject = "${lisp-project_cl-gtk2}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_cffi} ${lisp_cl-gtk2-gdk} ${lisp_cl-gtk2-glib} ${lisp_cl-gtk2-pango} ${lisp_iterate}";
      name = "lisp_cl-gtk2-gtk-20120909-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
