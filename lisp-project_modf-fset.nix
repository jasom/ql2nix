
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_modf-fset-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/modf-fset/2015-06-08/modf-fset-20150608-git.tgz";
        sha256 = "586077cce88bd0405868ef71e3ccf29165485cdc19e72e4f4805d6dd55fccc6a";
      };
    }
