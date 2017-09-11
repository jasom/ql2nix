
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_mini-cas-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/mini-cas/2015-09-23/mini-cas-20150923-git.tgz";
        sha256 = "b0c404d9899e3e7d4883a63fcab26cb6fbc51fe2ee28ebb4fb02944280930630";
      };
    }
