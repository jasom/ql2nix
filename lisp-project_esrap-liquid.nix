
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_esrap-liquid-20161031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/esrap-liquid/2016-10-31/esrap-liquid-20161031-git.tgz";
        sha256 = "01e913b6041d02d5ef1b27c43e5524d4e10d5c4edeae1d2826b0c711e2e4008d";
      };
    }
