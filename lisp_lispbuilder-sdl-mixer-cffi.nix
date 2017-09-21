
{ buildLispPackage, stdenv, fetchurl, lisp-project_lispbuilder, 
  SDL, SDL_mixer,   lisp_cffi,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi SDL SDL_mixer ];
      inherit stdenv;
      systemName = "lispbuilder-sdl-mixer-cffi";
      
      sourceProject = "${lisp-project_lispbuilder}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_lispbuilder-sdl-mixer-cffi-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
