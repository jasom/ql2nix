
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-abnf-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-abnf/2015-06-08/cl-abnf-20150608-git.tgz";
        sha256 = "0799bfdc43b7c645934af8c190e58d4d0fac3973ec669ef2feeae0b20f2ca903";
      };
    }
