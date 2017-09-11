
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-fluent-logger-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-fluent-logger/2017-07-25/cl-fluent-logger-20170725-git.tgz";
        sha256 = "b9845ab6f45381c8507927b508182a8eddab5456085723268823afa372b05c27";
      };
    }
