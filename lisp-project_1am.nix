
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_1am-20141106-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/1am/2014-11-06/1am-20141106-git.tgz";
        sha256 = "c6535d196bfa698116e8d6b8a016a7b41b39de67f8a51922193fe1e848c3d66e";
      };
    }
