
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-liballegro-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-liballegro/2017-01-24/cl-liballegro-20170124-git.tgz";
        sha256 = "562c1c6ebf302637b063b1f6ce95be21a281d54691cc9c7e34491e8f41377e0b";
      };
    }
