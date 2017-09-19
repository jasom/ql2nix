
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ucw-20160208-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ucw/2016-02-08/ucw-20160208-darcs.tgz";
        sha256 = "7078902594c94dd8b4fa7cfbd21a1ef16f463a8b1f91cf5c316089d3dd918091";
      };
    }
