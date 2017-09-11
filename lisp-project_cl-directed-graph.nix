
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-directed-graph-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-directed-graph/2016-12-04/cl-directed-graph-20161204-git.tgz";
        sha256 = "e7c9a92711f0fc00a2b68879c3caa9a7fd18bdefd0707f311e5398eb585f4128";
      };
    }
