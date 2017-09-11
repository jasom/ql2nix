
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_flac-parser-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/flac-parser/2017-07-25/flac-parser-20170725-git.tgz";
        sha256 = "c7536972d25cf28087d7c957662bb2b3b3fb7724f4171f8cb25b0fd3cc6d57bb";
      };
    }
