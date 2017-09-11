
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hh-web-20141106-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hh-web/2014-11-06/hh-web-20141106-git.tgz";
        sha256 = "14ea3afedc043b3c10b07586fda34330f5349211984d675ebabd6d1ee780a0b4";
      };
    }
