
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_climacs-20150505-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/climacs/2015-05-05/climacs-20150505-git.tgz";
        sha256 = "80e1873495b6a43684559976dc61196d357129c9b8c507ffd0cf30d21d1e91bf";
      };
    }
