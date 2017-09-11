
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-riff-20151031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-riff/2015-10-31/cl-riff-20151031-git.tgz";
        sha256 = "6f479e28e9dc1e4fd0f15883cd4a0fe4ab3b9ae4ed42060c632070451b2eb479";
      };
    }
