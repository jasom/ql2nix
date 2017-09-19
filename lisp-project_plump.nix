
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_plump-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/plump/2017-08-30/plump-20170830-git.tgz";
        sha256 = "45a5946c6972017fb5b708b6260b982075df8c1eedb9ad826731476db96adbc3";
      };
    }
