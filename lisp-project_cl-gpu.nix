
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-gpu-20160929-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-gpu/2016-09-29/cl-gpu-20160929-git.tgz";
        sha256 = "b0ae70581be774431d6aeb62e7c59c0b8998434a995286a791f1c234edecd784";
      };
    }
