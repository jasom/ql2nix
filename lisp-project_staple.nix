
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_staple-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/staple/2017-08-30/staple-20170830-git.tgz";
        sha256 = "bd7d19ffb6bc9fbe29cd429600bc6c792777e44c3c26551c452f7f578204a8b7";
      };
    }
