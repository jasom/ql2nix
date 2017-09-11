
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-lazy-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-lazy/2015-07-09/trivial-lazy-20150709-git.tgz";
        sha256 = "e176aa090dff56c0bb16d91dd1559ca924e4453bbf79a1240bc7b7249cf4e138";
      };
    }
