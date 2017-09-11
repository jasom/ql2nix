
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ht-simple-ajax-20130421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ht-simple-ajax/2013-04-21/ht-simple-ajax-20130421-git.tgz";
        sha256 = "417c5c02b2f7cdc212a0a6bb629fcb96583b1eee470529f57886adeaab54a1c4";
      };
    }
