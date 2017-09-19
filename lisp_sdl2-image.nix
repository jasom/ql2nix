
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-sdl2-image, 
  SDL2_image,   lisp_sdl2, lisp_cl-autowrap, lisp_defpackage-plus, lisp_alexandria,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_sdl2 lisp_cl-autowrap lisp_defpackage-plus lisp_alexandria SDL2_image ];
      inherit stdenv;
      systemName = "sdl2-image";
      
      sourceProject = "${lisp-project_cl-sdl2-image}";
      patches = [];
      lisp_dependencies = "${lisp_sdl2} ${lisp_cl-autowrap} ${lisp_defpackage-plus} ${lisp_alexandria}";
      name = "lisp_sdl2-image-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
