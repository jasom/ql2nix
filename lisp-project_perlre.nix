
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_perlre-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/perlre/2015-12-18/perlre-20151218-git.tgz";
        sha256 = "726f2bec88eea7df3d6abbb518c5ebe87d1a5c59ecbd3473f89e948f40adfa7e";
      };
    }
