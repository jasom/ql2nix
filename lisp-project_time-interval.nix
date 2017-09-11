
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_time-interval-20120520-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/time-interval/2012-05-20/time-interval-20120520-git.tgz";
        sha256 = "aa6542360a5b0e5680117e5c4c4a767433efb491d9c75c027a7026a08d60ec63";
      };
    }
