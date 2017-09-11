
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivialib-type-unify-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivialib.type-unify/2016-08-25/trivialib.type-unify-20160825-git.tgz";
        sha256 = "f7227a110dd307a4d5f2a71017a8534322dd057686a39371297a09f041687508";
      };
    }
