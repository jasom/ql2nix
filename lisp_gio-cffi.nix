
{ buildLispPackage, stdenv, fetchurl, lisp-project_gtk-cffi, 
   lisp_g-lib-cffi, lisp_g-object-cffi, lisp_gtk-cffi-utils,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_g-lib-cffi lisp_g-object-cffi lisp_gtk-cffi-utils  ];
      inherit stdenv;
      systemName = "gio-cffi";
      
      sourceProject = "${lisp-project_gtk-cffi}";
      patches = [];
      lisp_dependencies = "${lisp_g-lib-cffi} ${lisp_g-object-cffi} ${lisp_gtk-cffi-utils}";
      name = "lisp_gio-cffi-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
