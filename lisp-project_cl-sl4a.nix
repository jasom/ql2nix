
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-sl4a-20150804-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-sl4a/2015-08-04/cl-sl4a-20150804-git.tgz";
        sha256 = "baa286f3f4f2c24d9c8e745202ae63f117912896455819691ae8ebd5039a2173";
      };
    }
