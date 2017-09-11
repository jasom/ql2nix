
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_green-threads-20141217-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/green-threads/2014-12-17/green-threads-20141217-git.tgz";
        sha256 = "188ded6588c0eb284037925e345476b66c8d1209766ff1e16e5de3f1b7e193e0";
      };
    }
