
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_climon-20151031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/climon/2015-10-31/climon-20151031-git.tgz";
        sha256 = "6447503d7d8d6ca531a3184aa1c6c7bf16cb0b96755895e8a01ed387f73395dc";
      };
    }
