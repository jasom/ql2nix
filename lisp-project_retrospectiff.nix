
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_retrospectiff-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/retrospectiff/2017-04-03/retrospectiff-20170403-git.tgz";
        sha256 = "336464883b7e2c95921825d0d29cded50cf8d01296efb0148e30e10071544cea";
      };
    }
