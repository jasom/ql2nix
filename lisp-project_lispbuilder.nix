
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lispbuilder-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lispbuilder/2017-04-03/lispbuilder-20170403-git.tgz";
        sha256 = "cf8a0acb934130ebb51057ba2be4acacf6e75506ffae80a89116798de9e24809";
      };
    }
