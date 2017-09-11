
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_collectors-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/collectors/2016-12-04/collectors-20161204-git.tgz";
        sha256 = "ee8b0548395a5048372c8c7387d17f42147d2e8448ae47ca4e1aabdcbdf0c231";
      };
    }
