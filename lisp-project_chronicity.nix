
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_chronicity-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/chronicity/2016-03-18/chronicity-20160318-git.tgz";
        sha256 = "6999d149dd658088900fe4a2814dbc40c41a5df7fcb7062c1bee2f22f256a6b5";
      };
    }
