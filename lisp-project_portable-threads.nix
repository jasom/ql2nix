
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_portable-threads-20161031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/portable-threads/2016-10-31/portable-threads-20161031-git.tgz";
        sha256 = "e5293e9c40459f6da5a26ff9eabc1133989d08c98cbf386e352d8fefc9a4519b";
      };
    }
