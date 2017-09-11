
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lml-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lml/2015-09-23/lml-20150923-git.tgz";
        sha256 = "2131601721814d3ba8f914c9c8959fc1142d793e76ac207963206b676936037b";
      };
    }
