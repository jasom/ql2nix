
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-benchmark-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-benchmark/2017-08-30/trivial-benchmark-20170830-git.tgz";
        sha256 = "e2b3dbfee92154a95b32d4e0801f0a06867797b5fe22bd61e118f7e1e7bd7fd9";
      };
    }
