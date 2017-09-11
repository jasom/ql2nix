
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cffi-gtk, 
   lisp_bordeaux-threads, lisp_cffi, lisp_cl-cffi-gtk-glib, lisp_closer-mop, lisp_iterate, lisp_trivial-garbage,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_cffi lisp_cl-cffi-gtk-glib lisp_closer-mop lisp_iterate lisp_trivial-garbage  ];
      inherit stdenv;
      systemName = "cl-cffi-gtk-gobject";
      
      sourceProject = "${lisp-project_cl-cffi-gtk}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_cffi} ${lisp_cl-cffi-gtk-glib} ${lisp_closer-mop} ${lisp_iterate} ${lisp_trivial-garbage}";
      name = "lisp_cl-cffi-gtk-gobject-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
