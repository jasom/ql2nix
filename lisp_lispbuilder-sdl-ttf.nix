
{ buildLispPackage, stdenv, fetchurl, lisp-project_lispbuilder, 
   lisp_cffi, lisp_lispbuilder-sdl, lisp_lispbuilder-sdl-ttf-cffi,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_lispbuilder-sdl lisp_lispbuilder-sdl-ttf-cffi  ];
      inherit stdenv;
      systemName = "lispbuilder-sdl-ttf";
      
      sourceProject = "${lisp-project_lispbuilder}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_lispbuilder-sdl} ${lisp_lispbuilder-sdl-ttf-cffi}";
      name = "lisp_lispbuilder-sdl-ttf-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
