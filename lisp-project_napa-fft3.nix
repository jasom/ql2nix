
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_napa-fft3-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/napa-fft3/2015-12-18/napa-fft3-20151218-git.tgz";
        sha256 = "eaf52d6a0eed869b48239cc6d9979e046937e44d3a121c5d2e80290f9117a773";
      };
    }
