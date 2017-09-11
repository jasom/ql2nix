
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_sequence-iterators-20130813-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/sequence-iterators/2013-08-13/sequence-iterators-20130813-darcs.tgz";
        sha256 = "efd624f3001c5d0b103c88bfda6b7fa4333e50a69873a41d14b6824dd9ab36fd";
      };
    }
