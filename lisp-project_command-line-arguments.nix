
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_command-line-arguments-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/command-line-arguments/2015-12-18/command-line-arguments-20151218-git.tgz";
        sha256 = "d0fba1c0ac361aab4273425079945ee1ac8e7d7e7b9a960026a8c999e41edb1f";
      };
    }
