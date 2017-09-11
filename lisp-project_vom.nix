
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_vom-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/vom/2016-08-25/vom-20160825-git.tgz";
        sha256 = "23555955ed46c8a1f1790ac38dd1016e43f568140eb02355d5d962d43bb07457";
      };
    }
