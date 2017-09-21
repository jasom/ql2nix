
{ buildLispPackage, stdenv, fetchurl, lisp-project_gtk-cffi, 
  gnome3,   lisp_cl-cairo2, lisp_iterate, lisp_cffi-objects,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-cairo2 lisp_iterate lisp_cffi-objects gnome3.gtk ];
      inherit stdenv;
      systemName = "gtk-cffi";
      
      sourceProject = "${lisp-project_gtk-cffi}";
      patches = [];
      lisp_dependencies = "${lisp_cl-cairo2} ${lisp_iterate} ${lisp_cffi-objects}";
      name = "lisp_gtk-cffi-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }