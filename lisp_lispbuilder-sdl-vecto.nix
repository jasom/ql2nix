
{ buildLispPackage, stdenv, fetchurl, lisp-project_lispbuilder, 
  SDL,   lisp_vecto, lisp_cffi, lisp_cl-paths-ttf,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_vecto lisp_cffi lisp_cl-paths-ttf SDL ];
      inherit stdenv;
      systemName = "lispbuilder-sdl-vecto";
      
      sourceProject = "${lisp-project_lispbuilder}";
      patches = [];
      lisp_dependencies = "${lisp_vecto} ${lisp_cffi} ${lisp_cl-paths-ttf}";
      name = "lisp_lispbuilder-sdl-vecto-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
