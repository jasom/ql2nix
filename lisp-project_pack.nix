
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_pack-20110619-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/pack/2011-06-19/pack-20110619-git.tgz";
        sha256 = "b08b39d64f4cf6e27645d0b96dacfdee8491da5e41bc77f95c183ee4f9fd0368";
      };
    }
