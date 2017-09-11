
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cairo2, 
  gnome2,   lisp_cl-cairo2, lisp_cl-freetype2,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-cairo2 lisp_cl-freetype2 gnome2.gtk ];
      inherit stdenv;
      systemName = "cl-cairo2-xlib";
      
      sourceProject = "${lisp-project_cl-cairo2}";
      patches = [];
      lisp_dependencies = "${lisp_cl-cairo2} ${lisp_cl-freetype2}";
      name = "lisp_cl-cairo2-xlib-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
