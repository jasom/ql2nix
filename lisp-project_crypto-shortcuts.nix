
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_crypto-shortcuts-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/crypto-shortcuts/2017-08-30/crypto-shortcuts-20170830-git.tgz";
        sha256 = "a2727ff77f6cf914a02e09dec411614063a2e69534cb048baf72ad4de4f0163f";
      };
    }
