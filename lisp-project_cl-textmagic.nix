
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-textmagic-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-textmagic/2015-12-18/cl-textmagic-20151218-git.tgz";
        sha256 = "428bf1fdf1ece6c659df1f9154c18c5f64237f8a6be6515bc0581a23a70e0d43";
      };
    }
