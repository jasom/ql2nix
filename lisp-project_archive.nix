
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_archive-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/archive/2016-03-18/archive-20160318-git.tgz";
        sha256 = "69012bdf7afeaa06e7b23043e3482d594937e1b84e6643fe5a1d8fbc6e1b91fd";
      };
    }
