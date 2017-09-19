
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-sdl2, 
  SDL2,   lisp_cl-opengl, lisp_trivial-channels, lisp_trivial-garbage, lisp_cl-plus-c, lisp_cl-autowrap, lisp_alexandria,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-opengl lisp_trivial-channels lisp_trivial-garbage lisp_cl-plus-c lisp_cl-autowrap lisp_alexandria SDL2 ];
      inherit stdenv;
      systemName = "sdl2/examples";
      
      sourceProject = "${lisp-project_cl-sdl2}";
      patches = [];
      lisp_dependencies = "${lisp_cl-opengl} ${lisp_trivial-channels} ${lisp_trivial-garbage} ${lisp_cl-plus-c} ${lisp_cl-autowrap} ${lisp_alexandria}";
      name = "lisp_sdl2-examples-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
