
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_pettomato-indexed-priority-queue-20120909-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/pettomato-indexed-priority-queue/2012-09-09/pettomato-indexed-priority-queue-20120909-git.tgz";
        sha256 = "86d025599fb4d4c623741e2846517f8e6d00a1c94bc90fe20109b24271e6e31e";
      };
    }
