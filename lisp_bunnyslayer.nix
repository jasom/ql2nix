
{ buildLispPackage, stdenv, fetchurl, lisp-project_blackthorn-engine, 
  SDL_image, SDL_mixer,   lisp_cl-opengl, lisp_lispbuilder-sdl, lisp_cl-store, lisp_usocket, lisp_mt19937, lisp_cl-containers, lisp_iterate, lisp_cl-fad, lisp_command-line-arguments, lisp_trivial-features, lisp_alexandria,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-opengl lisp_lispbuilder-sdl lisp_cl-store lisp_usocket lisp_mt19937 lisp_cl-containers lisp_iterate lisp_cl-fad lisp_command-line-arguments lisp_trivial-features lisp_alexandria SDL_image SDL_mixer ];
      inherit stdenv;
      systemName = "bunnyslayer";
      
      sourceProject = "${lisp-project_blackthorn-engine}";
      patches = [];
      lisp_dependencies = "${lisp_cl-opengl} ${lisp_lispbuilder-sdl} ${lisp_cl-store} ${lisp_usocket} ${lisp_mt19937} ${lisp_cl-containers} ${lisp_iterate} ${lisp_cl-fad} ${lisp_command-line-arguments} ${lisp_trivial-features} ${lisp_alexandria}";
      name = "lisp_bunnyslayer-20150608-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
