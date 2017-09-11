
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-indeterminism-20150407-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-indeterminism/2015-04-07/cl-indeterminism-20150407-git.tgz";
        sha256 = "09eaba5e098be46db801d5e02280bdc0c842c18e0179ef56348a3da565ee372c";
      };
    }
