
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-decimals-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-decimals/2017-02-27/cl-decimals-20170227-git.tgz";
        sha256 = "d51303f2fb103d3a6e6e23f0ce538fc7808f93a91a58ff6380609553eaec088d";
      };
    }
