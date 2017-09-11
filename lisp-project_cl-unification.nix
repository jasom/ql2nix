
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-unification-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-unification/2017-06-30/cl-unification-20170630-git.tgz";
        sha256 = "9ff21dfb6ad14704382a446ad9166c9f7a5d8d54f3ad34b2bced8d1585637d18";
      };
    }
