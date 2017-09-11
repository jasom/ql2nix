
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_integral-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/integral/2016-03-18/integral-20160318-git.tgz";
        sha256 = "b660da228f525f9731e66a9a8e61564de64bf66fff08d81a63bcf2dd727a1921";
      };
    }
