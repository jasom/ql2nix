
{ buildLispPackage, stdenv, fetchurl, lisp-project_lispbuilder, 
   lisp_cffi, lisp_lispbuilder-opengl-1-1, lisp_lispbuilder-sdl,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_lispbuilder-opengl-1-1 lisp_lispbuilder-sdl  ];
      inherit stdenv;
      systemName = "lispbuilder-opengl-examples";
      
      sourceProject = "${lisp-project_lispbuilder}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_lispbuilder-opengl-1-1} ${lisp_lispbuilder-sdl}";
      name = "lisp_lispbuilder-opengl-examples-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
