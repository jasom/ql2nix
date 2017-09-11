
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_new-op-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/new-op/2017-06-30/new-op-20170630-git.tgz";
        sha256 = "6487dec71dad3d67067cb48cc7b3e898e04684becf0bde3b8b55f741d3c07cd1";
      };
    }
