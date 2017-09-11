
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-graph-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-graph/2017-06-30/cl-graph-20170630-git.tgz";
        sha256 = "b36342645aa0610c81d4fedb64f4a8ed99a2bdd170a1c07c170637a0373d2851";
      };
    }
