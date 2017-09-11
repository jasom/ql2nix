
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lisp-unit-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lisp-unit/2017-01-24/lisp-unit-20170124-git.tgz";
        sha256 = "9560c6edf8fc23444a10bce35f8d71973e60293e1f418ae6cde6e47d720a6c01";
      };
    }
