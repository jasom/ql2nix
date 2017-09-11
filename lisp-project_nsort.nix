
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_nsort-20150505-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/nsort/2015-05-05/nsort-20150505-git.tgz";
        sha256 = "e5f88864cdf25e03e3a0a44c56b1963e618057462bc0e9f8805128d902aa9e80";
      };
    }
