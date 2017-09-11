
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_closer-mop-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/closer-mop/2017-07-25/closer-mop-20170725-git.tgz";
        sha256 = "4c430b5e4fb4d5f023a7c9c830ee127dc925b2d08321be48fd63b3f809fc8461";
      };
    }
