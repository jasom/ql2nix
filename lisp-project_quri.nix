
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_quri-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/quri/2016-12-04/quri-20161204-git.tgz";
        sha256 = "7b29fe2c2746f2cf59eee703b2ff65b10e6ed2e10232f2c8456657d1e6402e92";
      };
    }
