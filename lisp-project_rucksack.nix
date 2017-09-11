
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_rucksack-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/rucksack/2015-06-08/rucksack-20150608-git.tgz";
        sha256 = "b2634d28c3c17b97277d5189cafa328f4ff04c6fc616fb7c760f6176f0121d75";
      };
    }
