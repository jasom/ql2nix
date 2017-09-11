
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_rutils-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/rutils/2017-07-25/rutils-20170725-git.tgz";
        sha256 = "1202280f5e25c48294605bea1d73b03de0c73b5a36c39836f7c68780d6f9d835";
      };
    }
