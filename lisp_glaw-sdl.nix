
{ buildLispPackage, stdenv, fetchurl, lisp-project_glaw, 
  SDL_image,   lisp_lispbuilder-sdl, lisp_cl-alc, lisp_cl-openal, lisp_cl-opengl,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lispbuilder-sdl lisp_cl-alc lisp_cl-openal lisp_cl-opengl SDL_image ];
      inherit stdenv;
      systemName = "glaw-sdl";
      
      sourceProject = "${lisp-project_glaw}";
      patches = [];
      lisp_dependencies = "${lisp_lispbuilder-sdl} ${lisp_cl-alc} ${lisp_cl-openal} ${lisp_cl-opengl}";
      name = "lisp_glaw-sdl-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
