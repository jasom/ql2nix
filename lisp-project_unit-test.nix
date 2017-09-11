
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_unit-test-20120520-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/unit-test/2012-05-20/unit-test-20120520-git.tgz";
        sha256 = "346deee5661e8f829ba2133adf848e04be06da5b073a3d0da114a72f5aea8baf";
      };
    }
