
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cffi-gtk, 
   lisp_cl-cffi-gtk-glib, lisp_cl-cffi-gtk-gobject,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-cffi-gtk-glib lisp_cl-cffi-gtk-gobject  ];
      inherit stdenv;
      systemName = "cl-cffi-gtk-gio";
      
      sourceProject = "${lisp-project_cl-cffi-gtk}";
      patches = [];
      lisp_dependencies = "${lisp_cl-cffi-gtk-glib} ${lisp_cl-cffi-gtk-gobject}";
      name = "lisp_cl-cffi-gtk-gio-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
