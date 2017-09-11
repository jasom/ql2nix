
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-github-v3-20130312-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-github-v3/2013-03-12/cl-github-v3-20130312-git.tgz";
        sha256 = "542e5b419f47b42d30077b21a6384d3b7f9b26285107835fd46d05be5d76b486";
      };
    }
