
{ buildLispPackage, stdenv, fetchurl, lisp-project_lispbuilder, 
  SDL_gfx,   lisp_cffi, lisp_lispbuilder-sdl,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_lispbuilder-sdl SDL_gfx ];
      inherit stdenv;
      systemName = "lispbuilder-sdl-gfx-cffi";
      
      sourceProject = "${lisp-project_lispbuilder}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_lispbuilder-sdl}";
      name = "lisp_lispbuilder-sdl-gfx-cffi-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
