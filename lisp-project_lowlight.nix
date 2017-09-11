
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lowlight-20131211-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lowlight/2013-12-11/lowlight-20131211-git.tgz";
        sha256 = "c5161b84f1cd26b1bd60e88de4db9cddbd5b3e6689481a99f5c5ab380f460de8";
      };
    }
