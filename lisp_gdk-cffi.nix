
{ buildLispPackage, stdenv, fetchurl, lisp-project_gtk-cffi, 
  gnome3,   lisp_cl-cairo2, lisp_g-lib-cffi, lisp_g-object-cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-cairo2 lisp_g-lib-cffi lisp_g-object-cffi gnome3.gtk ];
      inherit stdenv;
      systemName = "gdk-cffi";
      
      sourceProject = "${lisp-project_gtk-cffi}";
      patches = [];
      lisp_dependencies = "${lisp_cl-cairo2} ${lisp_g-lib-cffi} ${lisp_g-object-cffi}";
      name = "lisp_gdk-cffi-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
