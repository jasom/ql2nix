
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_random-sample-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/random-sample/2017-04-03/random-sample-20170403-git.tgz";
        sha256 = "c0441e5103e0ba95f31c4544993165f6d641168acded7762fb106caba87e3dde";
      };
    }
