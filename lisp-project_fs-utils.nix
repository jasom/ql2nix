
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fs-utils-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fs-utils/2017-08-30/fs-utils-20170830-git.tgz";
        sha256 = "9e42f8c4f447bcf94760299c9acd0b674786977c7353cb095ec2d9d6a8ab0e99";
      };
    }
