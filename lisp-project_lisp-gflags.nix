
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lisp-gflags-20151031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lisp-gflags/2015-10-31/lisp-gflags-20151031-git.tgz";
        sha256 = "e4b187ce405053e515a3d41da0cd0b6556cc000de479937a8ed7a1d5c5cf1021";
      };
    }
