
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-rsvg2, 
   lisp_cl-gtk2-gdk, lisp_cl-rsvg2,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-gtk2-gdk lisp_cl-rsvg2  ];
      inherit stdenv;
      systemName = "cl-rsvg2-pixbuf";
      
      sourceProject = "${lisp-project_cl-rsvg2}";
      patches = [];
      lisp_dependencies = "${lisp_cl-gtk2-gdk} ${lisp_cl-rsvg2}";
      name = "lisp_cl-rsvg2-pixbuf-20120107-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
