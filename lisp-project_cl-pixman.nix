
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-pixman-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-pixman/2017-08-30/cl-pixman-20170830-git.tgz";
        sha256 = "2b351f5f83700ada17207b7918be2d22324de23f79c230cd0916df6b94b56aa8";
      };
    }
