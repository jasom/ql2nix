
{ buildLispPackage, stdenv, fetchurl, lisp-project_sketch, 
   lisp_alexandria, lisp_cl-geometry, lisp_glkit, lisp_mathkit, lisp_md5, lisp_sdl2-image, lisp_sdl2-ttf, lisp_sdl2kit, lisp_split-sequence, lisp_static-vectors,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-geometry lisp_glkit lisp_mathkit lisp_md5 lisp_sdl2-image lisp_sdl2-ttf lisp_sdl2kit lisp_split-sequence lisp_static-vectors  ];
      inherit stdenv;
      systemName = "sketch";
      
      sourceProject = "${lisp-project_sketch}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-geometry} ${lisp_glkit} ${lisp_mathkit} ${lisp_md5} ${lisp_sdl2-image} ${lisp_sdl2-ttf} ${lisp_sdl2kit} ${lisp_split-sequence} ${lisp_static-vectors}";
      name = "lisp_sketch-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
