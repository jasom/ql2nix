
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_parse-float-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/parse-float/2017-01-24/parse-float-20170124-git.tgz";
        sha256 = "649f609e1a0bee923a979ffd92aa0625d55c187cb83fe06376da79839e5ac057";
      };
    }
