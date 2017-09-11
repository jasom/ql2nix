
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_chemical-compounds-1.0.2";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/chemical-compounds/2011-10-01/chemical-compounds-1.0.2.tgz";
        sha256 = "ee824d8cae82ca6b5eacbeee2d22236fd5525a82efeff808d61417af8c42cd89";
      };
    }
