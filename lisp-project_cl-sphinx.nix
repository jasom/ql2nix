
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-sphinx-20110619-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-sphinx/2011-06-19/cl-sphinx-20110619-git.tgz";
        sha256 = "39845dd967ef00682d4e5bb6939d5a902fc3f98db67fee57f68696dd98bb3d86";
      };
    }
