
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_architecture-hooks-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/architecture.hooks/2016-12-04/architecture.hooks-20161204-git.tgz";
        sha256 = "67612fa108b00245fdabb9061c70d9a42aac8563acee1282492629df2e4f4f1d";
      };
    }
