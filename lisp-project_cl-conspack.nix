
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-conspack-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-conspack/2017-04-03/cl-conspack-20170403-git.tgz";
        sha256 = "5a6f814acf83584a460dfe7545d8fd032dfdd0e6c883378da1f9c6aa8076f311";
      };
    }
