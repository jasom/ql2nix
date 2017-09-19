
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_local-time-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/local-time/2017-08-30/local-time-20170830-git.tgz";
        sha256 = "6cc8515a0ca36670365748896b97f5834501505ac3f27b2e23f9647be4dae1f1";
      };
    }
