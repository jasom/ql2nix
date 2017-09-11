
{ buildLispPackage, stdenv, fetchurl, lisp-project_lispbuilder, 
  SDL,   lisp_cffi, lisp_lispbuilder-sdl-binaries,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_lispbuilder-sdl-binaries SDL ];
      inherit stdenv;
      systemName = "lispbuilder-sdl-cffi";
      
      sourceProject = "${lisp-project_lispbuilder}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_lispbuilder-sdl-binaries}";
      name = "lisp_lispbuilder-sdl-cffi-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
