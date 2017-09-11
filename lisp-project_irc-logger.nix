
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_irc-logger-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/irc-logger/2015-09-23/irc-logger-20150923-git.tgz";
        sha256 = "fa6dbdd3429ab7b2c0ef09b13e2223babb5b0a7c98156a7d96aec10be112fcb5";
      };
    }
