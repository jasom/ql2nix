
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-online-learning-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-online-learning/2017-08-30/cl-online-learning-20170830-git.tgz";
        sha256 = "48e3f9b731d9c48c4b38ffe7dc65c6002852d4cf66586797c1f1222db485f711";
      };
    }
