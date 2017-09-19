
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_rpc4cl-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/rpc4cl/2015-06-08/rpc4cl-20150608-git.tgz";
        sha256 = "54b02b1361290e0b3df2e24b53cd62bded5b1e76d6bb3822ca2c997bdb460164";
      };
    }
