
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-sdl2-ttf, 
  SDL2_ttf,   lisp_alexandria, lisp_defpackage-plus, lisp_cl-autowrap, lisp_sdl2, lisp_cffi-libffi,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_defpackage-plus lisp_cl-autowrap lisp_sdl2 lisp_cffi-libffi SDL2_ttf ];
      inherit stdenv;
      systemName = "sdl2-ttf";
      
      sourceProject = "${lisp-project_cl-sdl2-ttf}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_defpackage-plus} ${lisp_cl-autowrap} ${lisp_sdl2} ${lisp_cffi-libffi}";
      name = "lisp_sdl2-ttf-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
