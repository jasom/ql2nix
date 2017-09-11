
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_teepeedee2-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/teepeedee2/2016-04-21/teepeedee2-20160421-git.tgz";
        sha256 = "0ebadde9a93c31c252a244d50e8a2961cf691453b264d8f1a32b10dd1907405d";
      };
    }
