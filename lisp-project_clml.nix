
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clml-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clml/2017-08-30/clml-20170830-git.tgz";
        sha256 = "211d64091b7c3b1b06e9befcb5b4a02d86275aabe7cef8bd927e9a39a1866a97";
      };
    }
