
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-cli-parser-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-cli-parser/2015-06-08/cl-cli-parser-20150608-git.tgz";
        sha256 = "75a660da49c4b00cf04ec90e7b7558fe236db73e723d50f3ae91f476c9a8b892";
      };
    }
