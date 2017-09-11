
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_letrec-20131111-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/letrec/2013-11-11/letrec-20131111-hg.tgz";
        sha256 = "b302de45f209a808a7f933512a74a73fc15f6988ef9925a97cde872b6e33b19f";
      };
    }
