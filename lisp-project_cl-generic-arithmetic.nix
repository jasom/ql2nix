
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-generic-arithmetic-20130720-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-generic-arithmetic/2013-07-20/cl-generic-arithmetic-20130720-hg.tgz";
        sha256 = "c9ee74dc5133a0339278f90a287ae5fad6b2bacfc4a49afe2ed5b8bac4bfe125";
      };
    }
