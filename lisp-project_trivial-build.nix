
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-build-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-build/2015-12-18/trivial-build-20151218-git.tgz";
        sha256 = "b68a7713176dac7ea06941d5024ad73cb6142142f00c37c2a6dfe1fba6028fc7";
      };
    }
