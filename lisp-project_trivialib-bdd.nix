
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivialib-bdd-20160531-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivialib.bdd/2016-05-31/trivialib.bdd-20160531-git.tgz";
        sha256 = "b87022756242dc52548e571415682b9158731db1805d5e1c0befafac77f383ac";
      };
    }
