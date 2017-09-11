
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-tetris3d-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-tetris3d/2016-04-21/cl-tetris3d-20160421-git.tgz";
        sha256 = "c19aea532473a877abef588065ed62d401e685e195990c6a289ff1118ae63b92";
      };
    }
