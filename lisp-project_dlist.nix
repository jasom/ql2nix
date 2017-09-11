
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_dlist-20121125-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/dlist/2012-11-25/dlist-20121125-git.tgz";
        sha256 = "26f1f584f9a99d68afb93ecebe75c386eaf25d133aa574cca5b028cd571bc4c5";
      };
    }
