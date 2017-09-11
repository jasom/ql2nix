
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lmdb-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lmdb/2017-04-03/lmdb-20170403-git.tgz";
        sha256 = "4378dae9b17f9fa2baf3f83325d01d863b5ef38315e0fa4d3817028728e76612";
      };
    }
