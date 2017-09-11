
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_eazy-gnuplot-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/eazy-gnuplot/2016-12-04/eazy-gnuplot-20161204-git.tgz";
        sha256 = "4415df029b20b7eaac51829e17f8eff07cd3bbca06353dd6fb0939fe9458e61e";
      };
    }
