
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-cont-20110219-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-cont/2011-02-19/cl-cont-20110219-darcs.tgz";
        sha256 = "a00f159c1df572af501d564abc37d5f907e2ff1d541fed6124c5cd2e34961813";
      };
    }
