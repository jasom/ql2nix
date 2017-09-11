
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_split-sequence-1.2";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/split-sequence/2015-08-04/split-sequence-1.2.tgz";
        sha256 = "145c5c36e0b4edf77e2cf6df7f8c6b3aa9018211e269cafb97e9631bb7f3a58b";
      };
    }
