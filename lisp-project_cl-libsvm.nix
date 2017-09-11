
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-libsvm-20141106-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-libsvm/2014-11-06/cl-libsvm-20141106-git.tgz";
        sha256 = "09e82b667091c39d1b90f860b71351078d3c62f76f7bd662b2eece225b456f5d";
      };
    }
