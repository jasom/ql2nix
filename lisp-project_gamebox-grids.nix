
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_gamebox-grids-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/gamebox-grids/2017-07-25/gamebox-grids-20170725-git.tgz";
        sha256 = "7bcf4148ab01506b5201fa052afb356ff640af8541c8571e9ec9564d6fc8a01f";
      };
    }
