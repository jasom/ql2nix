
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_electron-tools-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/electron-tools/2016-04-21/electron-tools-20160421-git.tgz";
        sha256 = "bfccb8bc44d972ecea140252b97ce44ff20c5b7bcba59c50dea7a855bb33352e";
      };
    }
