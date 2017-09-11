
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_staple-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/staple/2017-07-25/staple-20170725-git.tgz";
        sha256 = "644b1e3b6ca6dcc36da45f6f63d3fa0141e91630802366523ecabdeb71997708";
      };
    }
