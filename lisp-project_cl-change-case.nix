
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-change-case-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-change-case/2016-12-04/cl-change-case-20161204-git.tgz";
        sha256 = "b18e3b30714833ef64c14cb6660df71b20c0595019257b192f47f505af4f0026";
      };
    }
