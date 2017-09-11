
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_transparent-wrap-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/transparent-wrap/2015-07-09/transparent-wrap-20150709-git.tgz";
        sha256 = "53855de2088c1bb64490abdfe41d14393c85964ce074dd72b1b98e514252a2d8";
      };
    }
