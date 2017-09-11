
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-diceware-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-diceware/2015-09-23/cl-diceware-20150923-git.tgz";
        sha256 = "3820a20b8b7621ab7f6c68551665a1d9c7cee8b5c7cf935d00c96cff04f15dbc";
      };
    }
