
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-groupby-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-groupby/2017-08-30/cl-groupby-20170830-git.tgz";
        sha256 = "d2bb75e46167367febccede7ec54edc9838137e68f7ddc0ba0cf637b89879fbd";
      };
    }
