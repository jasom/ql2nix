
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_what3words-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/what3words/2016-12-04/what3words-20161204-git.tgz";
        sha256 = "8f66f776325da0c48c841bf23b5a33ded595be7f9e6a7c21821061e5f19bd8f4";
      };
    }
