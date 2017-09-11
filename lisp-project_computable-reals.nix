
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_computable-reals-20130312-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/computable-reals/2013-03-12/computable-reals-20130312-hg.tgz";
        sha256 = "43725cd58f0ba5f9161002da4573c8cd585c3cde69f70b75eed61aaaf066b0c6";
      };
    }
