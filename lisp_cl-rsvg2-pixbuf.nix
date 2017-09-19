
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-rsvg2, 
  librsvg,   lisp_cl-gtk2-gdk, lisp_trivial-gray-streams, lisp_cl-gtk2-glib, lisp_cl-cairo2, lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-gtk2-gdk lisp_trivial-gray-streams lisp_cl-gtk2-glib lisp_cl-cairo2 lisp_cffi librsvg ];
      inherit stdenv;
      systemName = "cl-rsvg2-pixbuf";
      
      sourceProject = "${lisp-project_cl-rsvg2}";
      patches = [];
      lisp_dependencies = "${lisp_cl-gtk2-gdk} ${lisp_trivial-gray-streams} ${lisp_cl-gtk2-glib} ${lisp_cl-cairo2} ${lisp_cffi}";
      name = "lisp_cl-rsvg2-pixbuf-20120107-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
