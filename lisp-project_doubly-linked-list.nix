
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_doubly-linked-list-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/doubly-linked-list/2017-07-25/doubly-linked-list-20170725-git.tgz";
        sha256 = "f806b3cbfa52d66990bff53638d62fdb6acd86ddc44d57d2cf40f0eb29d13d7f";
      };
    }
