
{ buildLispPackage, stdenv, fetchurl, lisp-project_sdl2kit, 
   lisp_cl-opengl, lisp_sdl2, lisp_alexandria,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-opengl lisp_sdl2 lisp_alexandria  ];
      inherit stdenv;
      systemName = "sdl2kit";
      
      sourceProject = "${lisp-project_sdl2kit}";
      patches = [];
      lisp_dependencies = "${lisp_cl-opengl} ${lisp_sdl2} ${lisp_alexandria}";
      name = "lisp_sdl2kit-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
