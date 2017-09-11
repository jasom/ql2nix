
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-num-utils-20131211-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-num-utils/2013-12-11/cl-num-utils-20131211-git.tgz";
        sha256 = "72f5976c1ef99b5d0030c93ca5a38443e14bcfa3ba3e7515e232e6259a8e1eac";
      };
    }
