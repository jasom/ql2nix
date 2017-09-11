
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-arrows-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-arrows/2016-03-18/cl-arrows-20160318-git.tgz";
        sha256 = "3848d8595117bfa12b8a471b36ca2609c38678eb71f6bb1666223088889d4e72";
      };
    }
