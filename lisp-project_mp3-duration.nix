
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_mp3-duration-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/mp3-duration/2016-02-08/mp3-duration-20160208-git.tgz";
        sha256 = "ca7a4ab86cfc8acca4ff7e019a1a2f09e184355ed409a8e8fa87c391dcc9bc46";
      };
    }
