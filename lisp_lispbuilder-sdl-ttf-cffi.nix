
{ buildLispPackage, stdenv, fetchurl, lisp-project_lispbuilder, 
  SDL, SDL_ttf,   lisp_cffi,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi SDL SDL_ttf ];
      inherit stdenv;
      systemName = "lispbuilder-sdl-ttf-cffi";
      
      sourceProject = "${lisp-project_lispbuilder}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_lispbuilder-sdl-ttf-cffi-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
