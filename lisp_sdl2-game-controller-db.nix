
{ buildLispPackage, stdenv, fetchurl, lisp-project_sdl2-game-controller-db, 
   lisp_sdl2,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_sdl2  ];
      inherit stdenv;
      systemName = "sdl2-game-controller-db";
      
      sourceProject = "${lisp-project_sdl2-game-controller-db}";
      patches = [];
      lisp_dependencies = "${lisp_sdl2}";
      name = "lisp_sdl2-game-controller-db-release-quicklisp-335d2b68-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
