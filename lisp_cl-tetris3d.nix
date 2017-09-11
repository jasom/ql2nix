
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-tetris3d, 
   lisp_cl-glu, lisp_cl-opengl, lisp_iterate, lisp_lispbuilder-sdl,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-glu lisp_cl-opengl lisp_iterate lisp_lispbuilder-sdl  ];
      inherit stdenv;
      systemName = "cl-tetris3d";
      
      sourceProject = "${lisp-project_cl-tetris3d}";
      patches = [];
      lisp_dependencies = "${lisp_cl-glu} ${lisp_cl-opengl} ${lisp_iterate} ${lisp_lispbuilder-sdl}";
      name = "lisp_cl-tetris3d-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
