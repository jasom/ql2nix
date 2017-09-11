
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_stem-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/stem/2015-06-08/stem-20150608-git.tgz";
        sha256 = "a9a6c50968eccd63cd279f1f2ed4ac63ef31f6d8495affadec8a4d4896edfda3";
      };
    }
