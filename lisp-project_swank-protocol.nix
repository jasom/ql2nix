
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_swank-protocol-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/swank-protocol/2015-12-18/swank-protocol-20151218-git.tgz";
        sha256 = "6f5730ef937fdd020edf81ce7233cc9b2651b0598c0e176cf7387cc8bccd84be";
      };
    }
