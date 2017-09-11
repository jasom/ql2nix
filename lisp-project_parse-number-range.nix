
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_parse-number-range-1.0";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/parse-number-range/2012-11-25/parse-number-range-1.0.tgz";
        sha256 = "352ecc1d0087cf268935a64ccc90b6b73e4ff505a47cff03dd893d0267fea643";
      };
    }
