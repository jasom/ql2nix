
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-rrt-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-rrt/2015-06-08/cl-rrt-20150608-git.tgz";
        sha256 = "337882ebbbc24f1ca7b294daad61ff74767693c8a82ffeaffb5bcb97c28bea42";
      };
    }
