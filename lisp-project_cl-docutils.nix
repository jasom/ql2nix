
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-docutils-20130128-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-docutils/2013-01-28/cl-docutils-20130128-git.tgz";
        sha256 = "64d15312e1926488125bcb97dcf68305ee019aea43260b8056df69736b5b61a5";
      };
    }
