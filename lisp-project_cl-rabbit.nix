
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-rabbit-20161031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-rabbit/2016-10-31/cl-rabbit-20161031-git.tgz";
        sha256 = "18b7a4634cbdabe0e9c812ec9f708362131d948c2a1303fb69994a8b6b0f0c71";
      };
    }
