
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_zaws-20150407-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/zaws/2015-04-07/zaws-20150407-git.tgz";
        sha256 = "a0b63c8dca0e38f89739c69a40c1b16e9dc8f096c27af600b11e45c2c5b42fd0";
      };
    }
