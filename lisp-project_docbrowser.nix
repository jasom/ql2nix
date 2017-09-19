
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_docbrowser-20141106-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/docbrowser/2014-11-06/docbrowser-20141106-git.tgz";
        sha256 = "ffa167c48826c2f73b6dcd86d311c78aba455bfe3361564122d54a86a14cc1d8";
      };
    }
