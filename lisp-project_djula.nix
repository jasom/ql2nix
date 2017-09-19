
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_djula-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/djula/2017-02-27/djula-20170227-git.tgz";
        sha256 = "4c63be682a4eee5bd907f4b3c1bfe2eb4ac4c354beaad86ab25d1ddad8a3fd4d";
      };
    }
