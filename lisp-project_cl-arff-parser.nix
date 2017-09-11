
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-arff-parser-20130421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-arff-parser/2013-04-21/cl-arff-parser-20130421-git.tgz";
        sha256 = "d39de440dc741c64ac729b0146911e33919d771693c62b6ae7f83473521ae070";
      };
    }
