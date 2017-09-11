
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-scsu-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-scsu/2017-06-30/cl-scsu-20170630-git.tgz";
        sha256 = "25f86d2cf4823806989065f8c9ecb8507c7927dc4d85b788833a65396b1d6520";
      };
    }
