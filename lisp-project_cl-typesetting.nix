
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-typesetting-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-typesetting/2017-07-25/cl-typesetting-20170725-git.tgz";
        sha256 = "af4e71f7e7bd63f917e4b3a6dd01d7bdc0301624bf0fa0ffc1426d141774ebc3";
      };
    }
