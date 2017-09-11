
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-cli-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-cli/2015-12-18/cl-cli-20151218-git.tgz";
        sha256 = "5ea10039be485f6e2553ab7b43d4e5355459b1dc4cf910d5844fd27c253f0934";
      };
    }
