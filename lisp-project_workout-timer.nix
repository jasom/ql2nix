
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_workout-timer-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/workout-timer/2017-08-30/workout-timer-20170830-git.tgz";
        sha256 = "52c76824f79fcd005d8e15a7fb04111834271b20bb36cf9534d4de7d371734bc";
      };
    }
