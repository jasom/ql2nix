
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_rt-events-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/rt-events/2016-03-18/rt-events-20160318-git.tgz";
        sha256 = "24baec701ee354ce8ee572f2f95fed8c0a0b4872091fd7251500b39b0a1ea164";
      };
    }
