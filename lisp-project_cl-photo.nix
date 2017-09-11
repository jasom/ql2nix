
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-photo-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-photo/2015-09-23/cl-photo-20150923-git.tgz";
        sha256 = "710d5ac3908fc4722a0cd5004d6cfc19da7e003224f06065594982b0d14330f5";
      };
    }
