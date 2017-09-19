
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cepl-release-quicklisp-2a61dc0d-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cepl/2017-08-30/cepl-release-quicklisp-2a61dc0d-git.tgz";
        sha256 = "59da9492a3b0791c2013dd8d61778885d66574cc9b5342bc24b1ab5ef7af0e85";
      };
    }
