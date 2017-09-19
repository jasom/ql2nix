
{ buildLispPackage, stdenv, fetchurl, lisp-project_cells-gtk3, 
  gnome2, freeglut,   lisp_cl-glu, lisp_cl-opengl, lisp_cl-cairo2-xlib, lisp_cl-cairo2, lisp_bordeaux-threads, lisp_cffi, lisp_cells,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-glu lisp_cl-opengl lisp_cl-cairo2-xlib lisp_cl-cairo2 lisp_bordeaux-threads lisp_cffi lisp_cells gnome2.gtkglext freeglut ];
      inherit stdenv;
      systemName = "test-gtk";
      
      sourceProject = "${lisp-project_cells-gtk3}";
      patches = [];
      lisp_dependencies = "${lisp_cl-glu} ${lisp_cl-opengl} ${lisp_cl-cairo2-xlib} ${lisp_cl-cairo2} ${lisp_bordeaux-threads} ${lisp_cffi} ${lisp_cells}";
      name = "lisp_test-gtk-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
