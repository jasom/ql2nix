
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_jsonrpc-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/jsonrpc/2017-07-25/jsonrpc-20170725-git.tgz";
        sha256 = "13aaf63a13c0b7a4d08471d4ac269c1773edacb2f1d96cda448beee888eddcf6";
      };
    }
