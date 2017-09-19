
{ buildLispPackage, stdenv, fetchurl, lisp-project_pal, 
  SDL, SDL_mixer, SDL_image,   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi SDL SDL_mixer SDL_image ];
      inherit stdenv;
      systemName = "bermuda";
      
      sourceProject = "${lisp-project_pal}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_bermuda-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
