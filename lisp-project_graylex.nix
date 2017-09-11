
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_graylex-20110522-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/graylex/2011-05-22/graylex-20110522-git.tgz";
        sha256 = "4909209f164f6b78bb71021cb9a8052cde747aab3d7a469bef2dbc8f1815d33d";
      };
    }
