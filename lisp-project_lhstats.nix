
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lhstats-20120107-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lhstats/2012-01-07/lhstats-20120107-git.tgz";
        sha256 = "9a86be664214a4fba4aa1e6e0cbcfa67f25e8c162fb646e917155b4844fa6970";
      };
    }
