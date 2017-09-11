
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_latex-table-20130312-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/latex-table/2013-03-12/latex-table-20130312-git.tgz";
        sha256 = "7b95631eaa37116544c0abe86c4c2a80415d1fb1a1dadd8ff565e1f0b6aaf3e2";
      };
    }
