
{ buildLispPackage, stdenv, fetchurl, lisp-project_cepl-sdl2-ttf, 
   lisp_cepl-sdl2, lisp_sdl2-ttf,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cepl-sdl2 lisp_sdl2-ttf  ];
      inherit stdenv;
      systemName = "cepl.sdl2-ttf";
      
      sourceProject = "${lisp-project_cepl-sdl2-ttf}";
      patches = [];
      lisp_dependencies = "${lisp_cepl-sdl2} ${lisp_sdl2-ttf}";
      name = "lisp_cepl-sdl2-ttf-release-quicklisp-4232bef8-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }