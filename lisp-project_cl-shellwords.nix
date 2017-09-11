
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-shellwords-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-shellwords/2015-09-23/cl-shellwords-20150923-git.tgz";
        sha256 = "13b3b983e381878b2f258ac116bdb5a138cb80e3e3824ee432515141af5460e5";
      };
    }
