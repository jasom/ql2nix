
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_dirt-release-quicklisp-b0f63553-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/dirt/2017-06-30/dirt-release-quicklisp-b0f63553-git.tgz";
        sha256 = "21a9c20e4fca773ad66d5d95a5b6faf5fab943363da4cd4e2782bce14ede07e8";
      };
    }
