
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_consix-20141217-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/consix/2014-12-17/consix-20141217-git.tgz";
        sha256 = "f406b420ecd0fac152d964e83c5301808b498152694fba4c4fcb7935d5961dfc";
      };
    }
