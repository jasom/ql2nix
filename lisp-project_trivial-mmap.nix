
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-mmap-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-mmap/2017-06-30/trivial-mmap-20170630-git.tgz";
        sha256 = "3c7419b3176f7800f97f929a5e80355744ac964dd0afec03d5305d7450c15780";
      };
    }
