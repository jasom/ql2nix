
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_algebraic-data-library-20131003-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/algebraic-data-library/2013-10-03/algebraic-data-library-20131003-hg.tgz";
        sha256 = "d8e63a3ceebca471eed376d81abb2b6eccd87f569a25b433de978a21e900cb76";
      };
    }
