
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-signal-20151031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-signal/2015-10-31/trivial-signal-20151031-git.tgz";
        sha256 = "a4a5f64b1e14631573b12ff57a0aa8229dc6343fe56ee549abc8eb08b68aaef5";
      };
    }
