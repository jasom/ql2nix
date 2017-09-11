
{ buildLispPackage, stdenv, fetchurl, lisp-project_lispbuilder, 
   lisp_cffi, lisp_lispbuilder-sdl-assets, lisp_lispbuilder-sdl-base, lisp_trivial-garbage,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_lispbuilder-sdl-assets lisp_lispbuilder-sdl-base lisp_trivial-garbage  ];
      inherit stdenv;
      systemName = "lispbuilder-sdl";
      
      sourceProject = "${lisp-project_lispbuilder}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_lispbuilder-sdl-assets} ${lisp_lispbuilder-sdl-base} ${lisp_trivial-garbage}";
      name = "lisp_lispbuilder-sdl-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
