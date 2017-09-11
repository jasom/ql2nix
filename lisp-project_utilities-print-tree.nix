
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_utilities-print-tree-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/utilities.print-tree/2016-12-04/utilities.print-tree-20161204-git.tgz";
        sha256 = "3bf09dde40a983d2d3da643d8db8d846c41529b3e06f58ac6916209dfbabc5a3";
      };
    }
