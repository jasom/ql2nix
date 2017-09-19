
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_rutils-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/rutils/2017-08-30/rutils-20170830-git.tgz";
        sha256 = "9c2e90f3c980fb36a4eb3e689773ddf44bc9a4365c169b40037078b8d191496e";
      };
    }
