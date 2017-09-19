
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_dexador-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/dexador/2017-08-30/dexador-20170830-git.tgz";
        sha256 = "6d37d5cc9543a375096bce66dd0da7e0a5d251562cb226ef67e130137b6654a5";
      };
    }
