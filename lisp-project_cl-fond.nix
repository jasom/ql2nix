
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-fond-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-fond/2017-08-30/cl-fond-20170830-git.tgz";
        sha256 = "07bd01d7739ec73d88fa9a018f57f6d8eabeafcc4fe881b8eda379dde62fd191";
      };
    }
