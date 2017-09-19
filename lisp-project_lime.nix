
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lime-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lime/2015-12-18/lime-20151218-git.tgz";
        sha256 = "8ceccf50041e910bf934a0b5cd52fed0d60d410e965afae15cc0952e29a2efcd";
      };
    }
