
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_croatoan-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/croatoan/2017-08-30/croatoan-20170830-git.tgz";
        sha256 = "0e2d49cac2b90e12170ae9fe5793dc49bbb637fd5bd67a3ef62e4d435910c43e";
      };
    }
