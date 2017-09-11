
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-mlep-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-mlep/2015-09-23/cl-mlep-20150923-git.tgz";
        sha256 = "638ba9eb3fe858df7d3170d16d87766a6e757d2cabec14ab7ec391ac7f929a13";
      };
    }
