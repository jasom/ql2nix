
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-markup-20131003-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-markup/2013-10-03/cl-markup-20131003-git.tgz";
        sha256 = "19c8b551e0e876b70e4db875b6aeb7afc451ca8bfe1bb77e20097765665163c6";
      };
    }
