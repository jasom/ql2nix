
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clack-errors-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clack-errors/2017-08-30/clack-errors-20170830-git.tgz";
        sha256 = "6d883ca28cb42997d5a2efde2acaab15a6af0656a09e4773ae222f1ef67ae884";
      };
    }
