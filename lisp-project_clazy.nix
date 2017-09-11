
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clazy-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clazy/2017-06-30/clazy-20170630-git.tgz";
        sha256 = "ca9fb4a4a73a1b5a86f606a5b3509daf6ef5a42a357ed0b3cda2bf8b6293715b";
      };
    }
