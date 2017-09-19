
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-tetris3d, 
   lisp_iterate, lisp_cl-glu, lisp_lispbuilder-sdl, lisp_cl-opengl,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate lisp_cl-glu lisp_lispbuilder-sdl lisp_cl-opengl  ];
      inherit stdenv;
      systemName = "cl-tetris3d";
      
      sourceProject = "${lisp-project_cl-tetris3d}";
      patches = [];
      lisp_dependencies = "${lisp_iterate} ${lisp_cl-glu} ${lisp_lispbuilder-sdl} ${lisp_cl-opengl}";
      name = "lisp_cl-tetris3d-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
