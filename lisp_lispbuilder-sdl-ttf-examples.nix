
{ buildLispPackage, stdenv, fetchurl, lisp-project_lispbuilder, 
   lisp_cffi, lisp_lispbuilder-sdl, lisp_lispbuilder-sdl-ttf,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_lispbuilder-sdl lisp_lispbuilder-sdl-ttf  ];
      inherit stdenv;
      systemName = "lispbuilder-sdl-ttf-examples";
      
      sourceProject = "${lisp-project_lispbuilder}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_lispbuilder-sdl} ${lisp_lispbuilder-sdl-ttf}";
      name = "lisp_lispbuilder-sdl-ttf-examples-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
