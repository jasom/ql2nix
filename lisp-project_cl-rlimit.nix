
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-rlimit-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-rlimit/2015-06-08/cl-rlimit-20150608-git.tgz";
        sha256 = "ab235249bfdefe0b47b699a1739f719a61f8ad6faa9dd60b48493a56dfdfa1f0";
      };
    }
