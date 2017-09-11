
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-jpeg-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-jpeg/2017-06-30/cl-jpeg-20170630-git.tgz";
        sha256 = "80460de88b75808fae1ba59824247b4ac6b06e2a4bd5898f9a0542aab6b09ff3";
      };
    }
