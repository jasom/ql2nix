
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_croatoan-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/croatoan/2017-07-25/croatoan-20170725-git.tgz";
        sha256 = "5ed2d73311f6ec9d240d4eb4f26f202e64a0de1e058c49bacd763dcae5c9a20c";
      };
    }
