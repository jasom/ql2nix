
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cffi-gtk, 
  gdk_pixbuf, cairo, pango, gnome3,   lisp_closer-mop, lisp_bordeaux-threads, lisp_trivial-garbage, lisp_iterate, lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_bordeaux-threads lisp_trivial-garbage lisp_iterate lisp_cffi gdk_pixbuf cairo pango gnome3.gtk ];
      inherit stdenv;
      systemName = "cl-cffi-gtk-example-gtk";
      
      sourceProject = "${lisp-project_cl-cffi-gtk}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_bordeaux-threads} ${lisp_trivial-garbage} ${lisp_iterate} ${lisp_cffi}";
      name = "lisp_cl-cffi-gtk-example-gtk-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
