
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-spark-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-spark/2015-07-09/cl-spark-20150709-git.tgz";
        sha256 = "92ed39966c6d7f1d4a2e04846baf436ed1fd3c6153fd09cd3b6a951d1ee256af";
      };
    }
