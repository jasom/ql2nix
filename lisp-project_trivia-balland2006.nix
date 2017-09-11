
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivia-balland2006-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivia.balland2006/2017-01-24/trivia.balland2006-20170124-git.tgz";
        sha256 = "6e0cd7a3982d2ff6b822eb1c7e3e20d92376d0717a2c6f58d8d09a68cb44efad";
      };
    }
