
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_access-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/access/2015-12-18/access-20151218-git.tgz";
        sha256 = "d4597dfc47903e58885d98ac98226d8351ebc1b40b8bca0db93787d6d9298238";
      };
    }
