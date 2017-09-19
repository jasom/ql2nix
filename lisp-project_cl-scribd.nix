
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-scribd-20130312-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-scribd/2013-03-12/cl-scribd-20130312-git.tgz";
        sha256 = "db26c73321ee920556de6515bde9df8d54474b11a39c13b077269b5c1edee1b0";
      };
    }
