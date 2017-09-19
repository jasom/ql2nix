
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_pathname-utils-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/pathname-utils/2017-08-30/pathname-utils-20170830-git.tgz";
        sha256 = "a55a3f704fd1c049dbb58555569d2b2e1b323f606d75e2cb20aedeb3569a2cb3";
      };
    }
