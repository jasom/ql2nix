
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_pileup-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/pileup/2015-07-09/pileup-20150709-git.tgz";
        sha256 = "b1cced00743d32d666e2c81b3e3572d93d08fef0c2bf58c0b10b8a7b9bf27fd4";
      };
    }
