
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fiasco-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fiasco/2017-08-30/fiasco-20170830-git.tgz";
        sha256 = "54e88a8ff25eaa1776e9fb50277bbfd7f8d4c996880f9c6b3760f9751a8f440e";
      };
    }
