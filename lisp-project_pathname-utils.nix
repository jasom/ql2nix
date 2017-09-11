
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_pathname-utils-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/pathname-utils/2017-06-30/pathname-utils-20170630-git.tgz";
        sha256 = "b7b0efcb6b1a9ca75aa9f468934f367c4d05afe23be98d922c8e640b5ba6d2c9";
      };
    }
