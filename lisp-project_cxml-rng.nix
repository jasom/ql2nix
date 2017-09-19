
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cxml-rng-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cxml-rng/2016-03-18/cxml-rng-20160318-git.tgz";
        sha256 = "7a5b0f14b0be790b4a948bf91f51dc6a371164d82958bdc07be9ebceaf9049d2";
      };
    }
