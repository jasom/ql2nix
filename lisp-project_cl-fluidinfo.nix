
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-fluidinfo-20130312-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-fluidinfo/2013-03-12/cl-fluidinfo-20130312-git.tgz";
        sha256 = "3139ea307a69cb0c38db34dca78ebe4be2ae55a694e8c9aa81935d32f755419d";
      };
    }
