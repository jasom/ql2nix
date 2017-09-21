
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-gtk2, 
  glib, pango,   lisp_closer-mop, lisp_bordeaux-threads, lisp_iterate, lisp_trivial-garbage, lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_bordeaux-threads lisp_iterate lisp_trivial-garbage lisp_cffi glib pango ];
      inherit stdenv;
      systemName = "cl-gtk2-pango";
      
      sourceProject = "${lisp-project_cl-gtk2}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_bordeaux-threads} ${lisp_iterate} ${lisp_trivial-garbage} ${lisp_cffi}";
      name = "lisp_cl-gtk2-pango-20120909-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
