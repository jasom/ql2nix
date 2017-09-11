
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_simple-logger-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/simple-logger/2017-07-25/simple-logger-20170725-git.tgz";
        sha256 = "e08593a9f261824c2bad2d13767b6eb65a720340e8befc01cbd4cbc0385a46aa";
      };
    }
