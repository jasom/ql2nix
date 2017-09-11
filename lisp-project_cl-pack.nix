
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-pack-20160929-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-pack/2016-09-29/cl-pack-20160929-git.tgz";
        sha256 = "2af0b15175b2c03cdf85ec41a3a70fabbb382c2783f53a079396bb42fb338bc5";
      };
    }
