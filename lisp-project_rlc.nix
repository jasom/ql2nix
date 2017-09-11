
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_rlc-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/rlc/2015-09-23/rlc-20150923-git.tgz";
        sha256 = "78b820f4ef14cc582c763b7eedd23a3f2d72b940764391418fc42a38c4de41cf";
      };
    }
