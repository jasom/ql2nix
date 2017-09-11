
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-paymill-20131111-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-paymill/2013-11-11/cl-paymill-20131111-git.tgz";
        sha256 = "0b087fcf6f7448e8a4b637476db6b5ed5aa4b5e7ec8cd6e77aa45172dd2418a0";
      };
    }
