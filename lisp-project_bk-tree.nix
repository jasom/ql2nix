
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_bk-tree-20130420-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/bk-tree/2013-04-20/bk-tree-20130420-git.tgz";
        sha256 = "d8e994d1c1252d846225558d6c27c73f6ea887506220049074e66815ab03f532";
      };
    }
