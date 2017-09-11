
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-gtk2, 
  pango,   lisp_cl-gtk2-glib, lisp_iterate,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-gtk2-glib lisp_iterate pango ];
      inherit stdenv;
      systemName = "cl-gtk2-pango";
      
      sourceProject = "${lisp-project_cl-gtk2}";
      patches = [];
      lisp_dependencies = "${lisp_cl-gtk2-glib} ${lisp_iterate}";
      name = "lisp_cl-gtk2-pango-20120909-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
