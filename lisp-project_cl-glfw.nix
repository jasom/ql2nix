
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-glfw-20150302-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-glfw/2015-03-02/cl-glfw-20150302-git.tgz";
        sha256 = "57b9c662a9333628b5a31ba9ccb07507f68a5b889d9f05e4561d37d2be6ece65";
      };
    }
