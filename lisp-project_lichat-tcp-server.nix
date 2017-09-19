
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lichat-tcp-server-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lichat-tcp-server/2017-08-30/lichat-tcp-server-20170830-git.tgz";
        sha256 = "b9c0e5a6fbe0939bae6c8527de3bab74c7f8d8464358f22b7ea707a5ee5d8f47";
      };
    }
