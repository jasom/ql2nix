
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_random-access-lists-20120208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/random-access-lists/2012-02-08/random-access-lists-20120208-git.tgz";
        sha256 = "8d6930458cd2bd6ea309dfb79975fc637b92b71f35f78a245ef5c26ff6aee35f";
      };
    }
