
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_getopt-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/getopt/2015-09-23/getopt-20150923-git.tgz";
        sha256 = "44e98111e97b1b6bccc1810c9b558a1b28403719a0f506bc372744c4b8c27f6f";
      };
    }
