
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_tap-unit-test-20111105-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/tap-unit-test/2011-11-05/tap-unit-test-20111105-git.tgz";
        sha256 = "ebb183c921e6c27d2d55f5f75642e99842c65e5335d2c01fdcc7baf8bbd823e9";
      };
    }
