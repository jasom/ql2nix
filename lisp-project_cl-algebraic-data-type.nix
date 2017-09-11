
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-algebraic-data-type-20141106-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-algebraic-data-type/2014-11-06/cl-algebraic-data-type-20141106-hg.tgz";
        sha256 = "ec1331c7fdc0e7063c8abe5394bfc0655e3c440790ef325ddf01004cf7fdff1d";
      };
    }
