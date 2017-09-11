
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cepl-sdl2-release-quicklisp-7374a73e-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cepl.sdl2/2017-06-30/cepl.sdl2-release-quicklisp-7374a73e-git.tgz";
        sha256 = "0b5c58d9cf86fcaca7ec84ba2ee6c1c5fac7000e323fcadb3e22a8b794106be3";
      };
    }
