
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_series-20131111-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/series/2013-11-11/series-20131111-git.tgz";
        sha256 = "7edeccdb1bca546e589dfbeb901dc5dacd8d676cea665c9e309b36d6909198d2";
      };
    }
