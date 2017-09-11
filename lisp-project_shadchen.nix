
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_shadchen-20131003-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/shadchen/2013-10-03/shadchen-20131003-git.tgz";
        sha256 = "3d2a6547c49330a99a6105f7f9b17907c9685028c0c96391ec07444283430c14";
      };
    }
