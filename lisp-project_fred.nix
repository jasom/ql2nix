
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fred-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fred/2015-09-23/fred-20150923-git.tgz";
        sha256 = "518ad391c2c1fec58cb5a37e7c2d338ee0953c83b542ef9b62cf077a4b5aac87";
      };
    }
