
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clos-diff-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clos-diff/2015-06-08/clos-diff-20150608-git.tgz";
        sha256 = "eb205fa055f075368112f400ec71a1c7d37233d7208ebf62e08877acedca170a";
      };
    }
