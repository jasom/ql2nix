
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-pixman-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-pixman/2017-07-25/cl-pixman-20170725-git.tgz";
        sha256 = "55163ce69e9b88f4b87c5caa692d4e703c176a7f8621523f8804aa0ffbf4950f";
      };
    }
