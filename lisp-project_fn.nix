
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fn-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fn/2017-08-30/fn-20170830-git.tgz";
        sha256 = "2ac529fe50c6b19f00b18014f0480bbc8b26aaeea85b9ef8fc636be4422f5d06";
      };
    }
