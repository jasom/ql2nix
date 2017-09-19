
{ buildLispPackage, stdenv, fetchurl, lisp-project_sdl2kit, 
   lisp_glkit, lisp_cl-opengl, lisp_sdl2, lisp_alexandria,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_glkit lisp_cl-opengl lisp_sdl2 lisp_alexandria  ];
      inherit stdenv;
      systemName = "sdl2kit-examples";
      
      sourceProject = "${lisp-project_sdl2kit}";
      patches = [];
      lisp_dependencies = "${lisp_glkit} ${lisp_cl-opengl} ${lisp_sdl2} ${lisp_alexandria}";
      name = "lisp_sdl2kit-examples-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
