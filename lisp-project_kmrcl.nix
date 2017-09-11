
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_kmrcl-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/kmrcl/2015-09-23/kmrcl-20150923-git.tgz";
        sha256 = "4f6460bdd06e30a3101933882bfd2ba665e3673142dc644ac624967b4db8a76b";
      };
    }
