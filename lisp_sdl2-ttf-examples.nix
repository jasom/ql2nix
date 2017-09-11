
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-sdl2-ttf, 
   lisp_alexandria, lisp_sdl2, lisp_sdl2-ttf, lisp_cl-opengl, lisp_mathkit,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_sdl2 lisp_sdl2-ttf lisp_cl-opengl lisp_mathkit  ];
      inherit stdenv;
      systemName = "sdl2-ttf-examples";
      
      sourceProject = "${lisp-project_cl-sdl2-ttf}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_sdl2} ${lisp_sdl2-ttf} ${lisp_cl-opengl} ${lisp_mathkit}";
      name = "lisp_sdl2-ttf-examples-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
