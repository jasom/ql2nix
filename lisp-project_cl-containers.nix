
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-containers-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-containers/2017-04-03/cl-containers-20170403-git.tgz";
        sha256 = "afafc5d18d07c783e37b1ad6ef29e8bc552292b4ddd5fd7544868cddcb5f9c72";
      };
    }
