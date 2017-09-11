
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-sdl2-mixer-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-sdl2-mixer/2017-06-30/cl-sdl2-mixer-20170630-git.tgz";
        sha256 = "0f2a0fb64b1cba7ef5a78aeb9f8ed2c2a720947e188c3fadcda54d33bed1717f";
      };
    }
