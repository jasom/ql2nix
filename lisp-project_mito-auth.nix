
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_mito-auth-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/mito-auth/2017-08-30/mito-auth-20170830-git.tgz";
        sha256 = "bad4f09cd5c8068e67c251ac97bc6d5bb32ccaf975bf9b9aeb5101973f02d4a0";
      };
    }
