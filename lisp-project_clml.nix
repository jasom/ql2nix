
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clml-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clml/2017-06-30/clml-20170630-git.tgz";
        sha256 = "15c74d01aa8668cca13cfd1d683fa5098cc5f525d1a918a7bd19d87708850fd3";
      };
    }
