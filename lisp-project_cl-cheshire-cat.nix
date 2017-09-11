
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-cheshire-cat-20121125-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-cheshire-cat/2012-11-25/cl-cheshire-cat-20121125-git.tgz";
        sha256 = "f4e84a1f2cd19ac90f5837247189cd61dab4c77ab1ef5536fbee759cbb2d79f0";
      };
    }
