
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_roan-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/roan/2017-08-30/roan-20170830-git.tgz";
        sha256 = "04ec11a6485438f69ca6362b10b3923c4b0a9558e8c50f18a010dbe62b7b0013";
      };
    }
