
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-parser-combinators-20131111-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-parser-combinators/2013-11-11/cl-parser-combinators-20131111-git.tgz";
        sha256 = "ba51719a70f901937a6d6dbb9415b91a874049ec5f78867d6798afaddc51e171";
      };
    }
