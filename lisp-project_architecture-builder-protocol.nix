
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_architecture-builder-protocol-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/architecture.builder-protocol/2017-08-30/architecture.builder-protocol-20170830-git.tgz";
        sha256 = "81599a06192e76d94db3ed26453c8644965d2301dc8c6d633581d60971720e29";
      };
    }
