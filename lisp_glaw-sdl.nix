
{ buildLispPackage, stdenv, fetchurl, lisp-project_glaw, 
  SDL_image,   lisp_glaw, lisp_lispbuilder-sdl,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_glaw lisp_lispbuilder-sdl SDL_image ];
      inherit stdenv;
      systemName = "glaw-sdl";
      
      sourceProject = "${lisp-project_glaw}";
      patches = [];
      lisp_dependencies = "${lisp_glaw} ${lisp_lispbuilder-sdl}";
      name = "lisp_glaw-sdl-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
