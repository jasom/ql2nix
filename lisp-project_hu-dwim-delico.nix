
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hu-dwim-delico-20151218-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hu.dwim.delico/2015-12-18/hu.dwim.delico-20151218-darcs.tgz";
        sha256 = "70a560b964c0a5f3626aab482b7f9c6d228115a67dd7cbabad10e2e5374764e7";
      };
    }
