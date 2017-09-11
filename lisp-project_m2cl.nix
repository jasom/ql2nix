
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_m2cl-20130128-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/m2cl/2013-01-28/m2cl-20130128-git.tgz";
        sha256 = "6f1f86873b54aeca812600e333fa9f06a6df236aa23e40ec63b4e2c339c6c8e5";
      };
    }
