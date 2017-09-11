
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_monkeylib-test-framework-20101207-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/monkeylib-test-framework/2010-12-07/monkeylib-test-framework-20101207-git.tgz";
        sha256 = "01b6c8d6ca500f95446aded905a73fca082fc00fea9b45814702e7a927119e21";
      };
    }
