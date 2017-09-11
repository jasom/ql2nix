
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_monkeylib-binary-data-20111203-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/monkeylib-binary-data/2011-12-03/monkeylib-binary-data-20111203-git.tgz";
        sha256 = "7abd5f0ccb2cbe54f99f817881dc732ad5ac89cedee1ff231f8bbb6c164e29a3";
      };
    }
