
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-mop-20150113-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-mop/2015-01-13/cl-mop-20150113-git.tgz";
        sha256 = "71b4e51e519cea49c192145566f7ee66d526df0f719fa7d9ce2209896e9399ff";
      };
    }
