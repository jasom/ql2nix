
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-base58-20150113-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-base58/2015-01-13/cl-base58-20150113-git.tgz";
        sha256 = "61e86a8219ce7488d2489b78e226bc187d5c805a6157a1f86b91638a09ce5a5d";
      };
    }
