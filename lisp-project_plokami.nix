
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_plokami-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/plokami/2016-02-08/plokami-20160208-git.tgz";
        sha256 = "07a6c5a2a6c285b4064924967b21cfa5bfa1c0dc5ebb69968415ecc10dd19624";
      };
    }
