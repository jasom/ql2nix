
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-main-thread-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-main-thread/2017-08-30/trivial-main-thread-20170830-git.tgz";
        sha256 = "639230a633f2139aa5fb0451ccc980f9c880dd1273ea8f85d722b04c5e9c65da";
      };
    }
