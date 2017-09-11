
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_graph-20161031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/graph/2016-10-31/graph-20161031-git.tgz";
        sha256 = "fce51d00c0475506b6020ab448627d8f22cac8743896437380a443d5298f5269";
      };
    }
