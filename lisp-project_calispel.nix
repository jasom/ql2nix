
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_calispel-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/calispel/2017-08-30/calispel-20170830-git.tgz";
        sha256 = "f1cc4344ffb99b36438f6495f6ce99e9b76051218e93dd56e1540e037dfd9563";
      };
    }
