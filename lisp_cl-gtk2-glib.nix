
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-gtk2, 
  glib,   lisp_bordeaux-threads, lisp_cffi, lisp_closer-mop, lisp_iterate, lisp_trivial-garbage,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_cffi lisp_closer-mop lisp_iterate lisp_trivial-garbage glib ];
      inherit stdenv;
      systemName = "cl-gtk2-glib";
      
      sourceProject = "${lisp-project_cl-gtk2}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_cffi} ${lisp_closer-mop} ${lisp_iterate} ${lisp_trivial-garbage}";
      name = "lisp_cl-gtk2-glib-20120909-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
