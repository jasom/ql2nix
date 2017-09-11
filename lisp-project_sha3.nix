
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_sha3-20160929-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/sha3/2016-09-29/sha3-20160929-git.tgz";
        sha256 = "5cde1ef01a42c5430fbb87b7628eb29288f2c8f473abf9137f5928bad79c51e2";
      };
    }
