
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-mpg123-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-mpg123/2017-08-30/cl-mpg123-20170830-git.tgz";
        sha256 = "515a4a2ec193993d9bfebd1d8edd6025e9d27cd5edd97acd7f363fadf050583e";
      };
    }
