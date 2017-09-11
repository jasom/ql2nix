
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_tinaa-20140211-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/tinaa/2014-02-11/tinaa-20140211-git.tgz";
        sha256 = "3cf777877f19f2d1bf59a373f892577094aea83705888bda1f5202db7a6eb3b1";
      };
    }
