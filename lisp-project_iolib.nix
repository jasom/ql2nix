
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_iolib-v0.8.3";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/iolib/2017-06-30/iolib-v0.8.3.tgz";
        sha256 = "ec444abb9d89bd0ac770f5e3a14859719c03da76d96fc95ae494d5eea5defa89";
      };
    }
