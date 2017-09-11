
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clss-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clss/2017-06-30/clss-20170630-git.tgz";
        sha256 = "c066e2533d217591924fd4cea74eb311c40cf174e48631dcfaf4a4f44fffb34d";
      };
    }
