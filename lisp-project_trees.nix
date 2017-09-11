
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trees_0.11";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trees/2010-10-06/trees_0.11.tgz";
        sha256 = "088c5114577dd6630aab451eed670797165623afcddfc07aa2781de33353299e";
      };
    }
