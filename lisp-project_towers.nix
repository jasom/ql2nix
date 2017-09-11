
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_towers-20141217-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/towers/2014-12-17/towers-20141217-git.tgz";
        sha256 = "fdaa7f21b17f97f2cd87f823f6d3ff0c149c44a5a6ff37cf4f53acc5de5d96c9";
      };
    }
