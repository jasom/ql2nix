
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-speedy-queue-20150302-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-speedy-queue/2015-03-02/cl-speedy-queue-20150302-git.tgz";
        sha256 = "19e702425750c34e8914662aa21929dd8b25288ae4f1797730b9513027db03f1";
      };
    }
