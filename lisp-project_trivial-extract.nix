
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-extract-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-extract/2016-04-21/trivial-extract-20160421-git.tgz";
        sha256 = "31480a2bae1aada9b9d168958460a4d86b421aa49be911232375b6d8e7250f08";
      };
    }
