
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_advanced-readtable-20130720-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/advanced-readtable/2013-07-20/advanced-readtable-20130720-git.tgz";
        sha256 = "b3bee73ba479d7952bf84c2c3d3e83b8ef8dc303c8011b9f194b6bf8f090c255";
      };
    }
