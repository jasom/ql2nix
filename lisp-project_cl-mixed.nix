
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-mixed-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-mixed/2017-07-25/cl-mixed-20170725-git.tgz";
        sha256 = "67f45fbeb2c6c02ad8a4a23e2fcdb0224968e6d4724509d3b169e7be3e4508a3";
      };
    }
