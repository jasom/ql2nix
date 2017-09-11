
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-gobject-introspection, 
  glib, gobjectIntrospection,   lisp_alexandria, lisp_cffi, lisp_iterate, lisp_trivial-garbage,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cffi lisp_iterate lisp_trivial-garbage glib gobjectIntrospection ];
      inherit stdenv;
      systemName = "cl-gobject-introspection";
      
      sourceProject = "${lisp-project_cl-gobject-introspection}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cffi} ${lisp_iterate} ${lisp_trivial-garbage}";
      name = "lisp_cl-gobject-introspection-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
