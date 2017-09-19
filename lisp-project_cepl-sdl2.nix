
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cepl-sdl2-release-quicklisp-6cb7a8db-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cepl.sdl2/2017-08-30/cepl.sdl2-release-quicklisp-6cb7a8db-git.tgz";
        sha256 = "12ddec98458fd03af3483a33f2ff38a1cfb0a1dbfa75ce00fc4bc126a71202d6";
      };
    }
