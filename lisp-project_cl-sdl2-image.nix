
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-sdl2-image-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-sdl2-image/2017-06-30/cl-sdl2-image-20170630-git.tgz";
        sha256 = "6647e419a27f2c705ec7885b8a052cd2764a02d84c6778508f96b387719a4dad";
      };
    }
