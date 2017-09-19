
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-hash-util-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-hash-util/2017-08-30/cl-hash-util-20170830-git.tgz";
        sha256 = "c606303a8540c240e97b0b97087d8f8f8bfdafce6621f946361b1c84368c3645";
      };
    }
