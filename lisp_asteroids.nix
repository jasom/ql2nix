
{ buildLispPackage, stdenv, fetchurl, lisp-project_asteroids, 
   lisp_lispbuilder-sdl, lisp_lispbuilder-sdl-gfx, lisp_lispbuilder-sdl-mixer,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lispbuilder-sdl lisp_lispbuilder-sdl-gfx lisp_lispbuilder-sdl-mixer  ];
      inherit stdenv;
      systemName = "asteroids";
      
      sourceProject = "${lisp-project_asteroids}";
      patches = [];
      lisp_dependencies = "${lisp_lispbuilder-sdl} ${lisp_lispbuilder-sdl-gfx} ${lisp_lispbuilder-sdl-mixer}";
      name = "lisp_asteroids-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
