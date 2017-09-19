
{ buildLispPackage, stdenv, fetchurl, lisp-project_sketch, 
   lisp_split-sequence, lisp_sdl2kit, lisp_sdl2-ttf, lisp_sdl2-image, lisp_md5, lisp_glkit, lisp_cl-geometry, lisp_alexandria,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence lisp_sdl2kit lisp_sdl2-ttf lisp_sdl2-image lisp_md5 lisp_glkit lisp_cl-geometry lisp_alexandria  ];
      inherit stdenv;
      systemName = "sketch";
      
      sourceProject = "${lisp-project_sketch}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence} ${lisp_sdl2kit} ${lisp_sdl2-ttf} ${lisp_sdl2-image} ${lisp_md5} ${lisp_glkit} ${lisp_cl-geometry} ${lisp_alexandria}";
      name = "lisp_sketch-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
