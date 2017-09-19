
{ buildLispPackage, stdenv, fetchurl, lisp-project_lispbuilder, 
  SDL,   lisp_cffi, lisp_cl-paths-ttf,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_cl-paths-ttf SDL ];
      inherit stdenv;
      systemName = "lispbuilder-sdl-cl-vectors";
      
      sourceProject = "${lisp-project_lispbuilder}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_cl-paths-ttf}";
      name = "lisp_lispbuilder-sdl-cl-vectors-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
