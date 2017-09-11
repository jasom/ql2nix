
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lfarm-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lfarm/2015-06-08/lfarm-20150608-git.tgz";
        sha256 = "c6d087fd84d8b2094751b23750020314cb121f16f18ea03ff3011852956372e6";
      };
    }
