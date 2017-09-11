
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_sheeple-20150302-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/sheeple/2015-03-02/sheeple-20150302-git.tgz";
        sha256 = "105ce627f6574614b9e1766bdec0eaa017ffaacccfd8971310e988fb0985e762";
      };
    }
