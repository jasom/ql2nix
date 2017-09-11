
{ buildLispPackage, stdenv, fetchurl, lisp-project_lispbuilder, 
  SDL_image,   lisp_cffi, lisp_lispbuilder-sdl, lisp_lispbuilder-sdl-image-binaries,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_lispbuilder-sdl lisp_lispbuilder-sdl-image-binaries SDL_image ];
      inherit stdenv;
      systemName = "lispbuilder-sdl-image-cffi";
      
      sourceProject = "${lisp-project_lispbuilder}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_lispbuilder-sdl} ${lisp_lispbuilder-sdl-image-binaries}";
      name = "lisp_lispbuilder-sdl-image-cffi-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
