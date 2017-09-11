
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_quickutil-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/quickutil/2016-12-04/quickutil-20161204-git.tgz";
        sha256 = "ef6b171dd8a36bb1ae26939f8a01fbbd5ba878126b8531911d75d428f34bcdbf";
      };
    }
