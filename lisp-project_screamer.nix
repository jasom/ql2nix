
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_screamer-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/screamer/2015-07-09/screamer-20150709-git.tgz";
        sha256 = "5d82876db9a8d38d401439498a7c0244b05a8b129ac1d73fce6459ff3623e8b5";
      };
    }
