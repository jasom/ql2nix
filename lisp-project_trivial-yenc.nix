
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-yenc-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-yenc/2016-12-04/trivial-yenc-20161204-git.tgz";
        sha256 = "b1757158490bea9e8cc90aea4f49cc9c36a1a64649428422046a7281b1dbf468";
      };
    }
