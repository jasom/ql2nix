
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_reversi-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/reversi/2015-09-23/reversi-20150923-git.tgz";
        sha256 = "a34be3c5e17d6a196b59f040e2828e5cfa763763440a3862d693025352e37f6b";
      };
    }
