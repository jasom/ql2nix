
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_opticl-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/opticl/2017-08-30/opticl-20170830-git.tgz";
        sha256 = "aedf5f39e86e0f2753b26137bafabb52b45631511b4dfc278a7e02272fc2c930";
      };
    }
