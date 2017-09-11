
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_mt19937-1.1.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/mt19937/2011-02-19/mt19937-1.1.1.tgz";
        sha256 = "bb076745fc1f589f9f2a0f824d1f5340f6036920117901f67cbef008961986c7";
      };
    }
