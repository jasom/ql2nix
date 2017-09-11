
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_sketch-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/sketch/2017-07-25/sketch-20170725-git.tgz";
        sha256 = "7c6861107515dec5fc58916f944b1866d12647282988a5d76bd0d2d93a08dbf4";
      };
    }
