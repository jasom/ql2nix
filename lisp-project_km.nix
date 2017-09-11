
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_km-2-5-33";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/km/2011-05-22/km-2-5-33.tgz";
        sha256 = "c94ae54314b73a99d02ca54ee1b8eaa8a07d17f849ad13ee1a0c20cb8a4db9f3";
      };
    }
