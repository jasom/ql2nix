
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-rsvg2, 
  librsvg,   lisp_cffi, lisp_cl-cairo2, lisp_cl-gtk2-glib, lisp_trivial-gray-streams,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_cl-cairo2 lisp_cl-gtk2-glib lisp_trivial-gray-streams librsvg ];
      inherit stdenv;
      systemName = "cl-rsvg2";
      
      sourceProject = "${lisp-project_cl-rsvg2}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_cl-cairo2} ${lisp_cl-gtk2-glib} ${lisp_trivial-gray-streams}";
      name = "lisp_cl-rsvg2-20120107-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
