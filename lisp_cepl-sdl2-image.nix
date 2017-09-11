
{ buildLispPackage, stdenv, fetchurl, lisp-project_cepl-sdl2-image, 
   lisp_cepl, lisp_sdl2, lisp_sdl2-image,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cepl lisp_sdl2 lisp_sdl2-image  ];
      inherit stdenv;
      systemName = "cepl.sdl2-image";
      
      sourceProject = "${lisp-project_cepl-sdl2-image}";
      patches = [];
      lisp_dependencies = "${lisp_cepl} ${lisp_sdl2} ${lisp_sdl2-image}";
      name = "lisp_cepl-sdl2-image-release-quicklisp-94a77649-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
