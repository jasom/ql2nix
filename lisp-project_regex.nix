
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_regex-20120909-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/regex/2012-09-09/regex-20120909-git.tgz";
        sha256 = "7ac94553073dca1a9890ddbf8e7f1e532151ac2e1f51e95c1085143ac179ad1c";
      };
    }
