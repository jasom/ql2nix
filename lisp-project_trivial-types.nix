
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-types-20120407-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-types/2012-04-07/trivial-types-20120407-git.tgz";
        sha256 = "bdaf0e7174a1be45c8b13854361dcb5967fcb90ab37eae3913178bb8d7727478";
      };
    }
