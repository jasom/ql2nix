
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-sdl2-mixer, 
  SDL2_mixer,   lisp_alexandria, lisp_defpackage-plus, lisp_cl-autowrap, lisp_sdl2,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_defpackage-plus lisp_cl-autowrap lisp_sdl2 SDL2_mixer ];
      inherit stdenv;
      systemName = "sdl2-mixer";
      
      sourceProject = "${lisp-project_cl-sdl2-mixer}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_defpackage-plus} ${lisp_cl-autowrap} ${lisp_sdl2}";
      name = "lisp_sdl2-mixer-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
