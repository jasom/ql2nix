
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_dissect-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/dissect/2017-08-30/dissect-20170830-git.tgz";
        sha256 = "e22b700ecc0a473506551d97cda57755251d5b75a5eda5f0d4346aca386fc9ec";
      };
    }
