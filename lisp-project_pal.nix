
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_pal-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/pal/2015-06-08/pal-20150608-git.tgz";
        sha256 = "77a8fe6b8e37440e7ea41e8c2a3ca0d218f31852ca4982eec7d5f389e96feea3";
      };
    }
