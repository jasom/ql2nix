
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_restful-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/restful/2015-06-08/restful-20150608-git.tgz";
        sha256 = "e254d3e2bb28da4d6d633ad84df5a67dea84db270a0abb3f48a09ba821693718";
      };
    }
