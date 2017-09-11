
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ieee-floats-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ieee-floats/2016-03-18/ieee-floats-20160318-git.tgz";
        sha256 = "a47baa0658b5ab8c202e85327a2dac5f639ae82471aed2b9ebee795fb0c1846f";
      };
    }
