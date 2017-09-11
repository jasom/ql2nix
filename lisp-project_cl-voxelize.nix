
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-voxelize-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-voxelize/2015-07-09/cl-voxelize-20150709-git.tgz";
        sha256 = "5065ee291402b31d14082d8decd627d3c90276e276ecfdaeca7ba1f56a422c4b";
      };
    }
