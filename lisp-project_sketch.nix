
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_sketch-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/sketch/2017-08-30/sketch-20170830-git.tgz";
        sha256 = "76b0ab4ff2e8004e434be6bb428ee4c6fcd785f5983f5d6b0c99d6d0312d4bc9";
      };
    }
