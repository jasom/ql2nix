
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-sdl2, 
  SDL2,   lisp_alexandria, lisp_cl-autowrap, lisp_cl-plus-c, lisp_trivial-garbage, lisp_trivial-channels,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-autowrap lisp_cl-plus-c lisp_trivial-garbage lisp_trivial-channels SDL2 ];
      inherit stdenv;
      systemName = "sdl2";
      
      sourceProject = "${lisp-project_cl-sdl2}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-autowrap} ${lisp_cl-plus-c} ${lisp_trivial-garbage} ${lisp_trivial-channels}";
      name = "lisp_sdl2-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
