
{ buildLispPackage, stdenv, fetchurl, lisp-project_cells-gtk3, 
  glib, gnome2,   lisp_bordeaux-threads, lisp_cffi, lisp_cells,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_cffi lisp_cells gnome2.gtkglext glib gnome2.gtk ];
      inherit stdenv;
      systemName = "gtk-ffi";
      
      sourceProject = "${lisp-project_cells-gtk3}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_cffi} ${lisp_cells}";
      name = "lisp_gtk-ffi-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
