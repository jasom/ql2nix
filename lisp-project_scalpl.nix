
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_scalpl-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/scalpl/2017-08-30/scalpl-20170830-git.tgz";
        sha256 = "ced871e6f25e689535e6359b699e0a6cdc78eb11ad5ff2a74d97a4d7b1410630";
      };
    }
