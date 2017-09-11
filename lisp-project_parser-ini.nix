
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_parser-ini-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/parser.ini/2017-02-27/parser.ini-20170227-git.tgz";
        sha256 = "e5fccaf3750ab5e1ed0c78e818364d39c68057174733f8ceace5b1f15724d05d";
      };
    }
