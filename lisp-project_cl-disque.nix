
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-disque-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-disque/2015-09-23/cl-disque-20150923-git.tgz";
        sha256 = "1c01e1e7921348210705ea8d02be03ef84429b9984dc28e2d739cf77606a38dd";
      };
    }
