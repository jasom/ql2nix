
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_quux-time-20150407-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/quux-time/2015-04-07/quux-time-20150407-git.tgz";
        sha256 = "284fe7743a3430d80563de6adcb1ce092295d001ff59f31ba324bde3469bd50b";
      };
    }
