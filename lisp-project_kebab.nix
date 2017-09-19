
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_kebab-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/kebab/2015-06-08/kebab-20150608-git.tgz";
        sha256 = "a118cecaa15f10f44712e118598da98b7ea4417bdfa3cff3c20d3debc77069ff";
      };
    }
