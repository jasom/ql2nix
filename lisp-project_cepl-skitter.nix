
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cepl-skitter-release-quicklisp-f52b9240-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cepl.skitter/2017-06-30/cepl.skitter-release-quicklisp-f52b9240-git.tgz";
        sha256 = "2e148442aa543c58d0e7c0641a01689e67dae289faf8d22378ed6eb6393f4574";
      };
    }
