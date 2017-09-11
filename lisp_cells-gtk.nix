
{ buildLispPackage, stdenv, fetchurl, lisp-project_cells-gtk3, 
   lisp_bordeaux-threads, lisp_cells, lisp_cl-cairo2, lisp_cl-cairo2-xlib, lisp_cl-glu, lisp_cl-glut, lisp_cl-opengl, lisp_gtk-ffi, lisp_ph-maths, lisp_pod-utils, lisp_utils-kt,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_cells lisp_cl-cairo2 lisp_cl-cairo2-xlib lisp_cl-glu lisp_cl-glut lisp_cl-opengl lisp_gtk-ffi lisp_ph-maths lisp_pod-utils lisp_utils-kt  ];
      inherit stdenv;
      systemName = "cells-gtk";
      
      sourceProject = "${lisp-project_cells-gtk3}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_cells} ${lisp_cl-cairo2} ${lisp_cl-cairo2-xlib} ${lisp_cl-glu} ${lisp_cl-glut} ${lisp_cl-opengl} ${lisp_gtk-ffi} ${lisp_ph-maths} ${lisp_pod-utils} ${lisp_utils-kt}";
      name = "lisp_cells-gtk-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
