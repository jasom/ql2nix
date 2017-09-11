
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cleric-20141106-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cleric/2014-11-06/cleric-20141106-git.tgz";
        sha256 = "4a50bc49c7d099b2a2319c636e4ff3a37006a8c6b51dc9e1f9fa4f61ac3d9e50";
      };
    }
