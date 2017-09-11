
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-sdl2-ttf-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-sdl2-ttf/2017-06-30/cl-sdl2-ttf-20170630-git.tgz";
        sha256 = "5f295282a7195c6452adbccd307a21e1a8bf82383a9ba637f37da0a4fbef8da8";
      };
    }
