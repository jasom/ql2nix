
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_diff-match-patch-20161031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/diff-match-patch/2016-10-31/diff-match-patch-20161031-git.tgz";
        sha256 = "e32dc2308836b29b1f1e997eeb865183a820354f2087ded20d3086a0477f922a";
      };
    }
