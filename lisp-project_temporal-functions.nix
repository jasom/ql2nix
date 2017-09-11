
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_temporal-functions-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/temporal-functions/2017-06-30/temporal-functions-20170630-git.tgz";
        sha256 = "d5ce3a0b734b313d70a7ce9bb6b447a6b3d1267298bc71f381425524349914a1";
      };
    }
