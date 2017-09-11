
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_rtg-math-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/rtg-math/2017-07-25/rtg-math-20170725-git.tgz";
        sha256 = "6a4f2ef9648522c9629f7e01b0fa86a2a3514e0247d8685ca3ea65855c754d87";
      };
    }
