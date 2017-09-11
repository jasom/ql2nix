
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_harmony-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/harmony/2017-07-25/harmony-20170725-git.tgz";
        sha256 = "ac6787ef20971d835cd45812b213024998f41466b8c3d1864edb822a888c6c4e";
      };
    }
