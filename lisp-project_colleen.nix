
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_colleen-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/colleen/2017-06-30/colleen-20170630-git.tgz";
        sha256 = "5bff275bcbc3071f8c1270615408c09d1ca43fe5cb2c2e4bef686d6c187305b8";
      };
    }
