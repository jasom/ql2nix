
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-sdl2-ttf, 
  SDL2_ttf,   lisp_mathkit, lisp_cl-opengl, lisp_cffi-libffi, lisp_sdl2, lisp_alexandria,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_mathkit lisp_cl-opengl lisp_cffi-libffi lisp_sdl2 lisp_alexandria SDL2_ttf ];
      inherit stdenv;
      systemName = "sdl2-ttf-examples";
      
      sourceProject = "${lisp-project_cl-sdl2-ttf}";
      patches = [];
      lisp_dependencies = "${lisp_mathkit} ${lisp_cl-opengl} ${lisp_cffi-libffi} ${lisp_sdl2} ${lisp_alexandria}";
      name = "lisp_sdl2-ttf-examples-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
