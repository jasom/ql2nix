
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-annot-prove-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-annot-prove/2015-09-23/cl-annot-prove-20150923-git.tgz";
        sha256 = "917ec4fa17d4320cb1fbf740797cbfd1068b2e180a1a330169569d669dd34aa7";
      };
    }
