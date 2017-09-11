
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cepl-release-quicklisp-d24231e2-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cepl/2017-07-25/cepl-release-quicklisp-d24231e2-git.tgz";
        sha256 = "3893066ea4996c7bfc443528d8e3277da7caa7a77ed01a3d10c566fa6ff34cda";
      };
    }
