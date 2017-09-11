
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_workout-timer-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/workout-timer/2017-04-03/workout-timer-20170403-git.tgz";
        sha256 = "b3c64e6acbc1145d4449eba55cfa2a2ac1ef5be7810e71593959dd206662f161";
      };
    }
