
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lredis-20141106-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lredis/2014-11-06/lredis-20141106-git.tgz";
        sha256 = "29444abec8a38ac39b077fecd022648bbc5f3b243ec42dd0a8354dfc947be8d2";
      };
    }
