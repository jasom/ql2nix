
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-abstract-classes-20130128-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-abstract-classes/2013-01-28/cl-abstract-classes-20130128-hg.tgz";
        sha256 = "66914d03a5ba44ece38037f5f9851f0b8d9ecab5485f6a14a7bd8fa40b06a1e1";
      };
    }
