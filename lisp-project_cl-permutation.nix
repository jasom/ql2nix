
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-permutation-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-permutation/2017-01-24/cl-permutation-20170124-git.tgz";
        sha256 = "0eb4f8ce6b5733342e83895e7469ba9de43d11e982fb3f2238cdcde21700412f";
      };
    }
