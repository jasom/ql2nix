
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_testbild-20101207-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/testbild/2010-12-07/testbild-20101207-git.tgz";
        sha256 = "8b6357f488dbb46520b48d97c2b6866a1fbbb2a7339c19eab219baefc98a01e7";
      };
    }
