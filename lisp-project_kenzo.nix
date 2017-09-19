
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_kenzo-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/kenzo/2017-08-30/kenzo-20170830-git.tgz";
        sha256 = "157948b7a300b3eea10c077c6c6054ef1eb175994f2c1577ecaf5a71465aa55d";
      };
    }
