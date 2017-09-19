
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-ssdb-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-ssdb/2017-08-30/cl-ssdb-20170830-git.tgz";
        sha256 = "b696a8ea4763b0b5ab74956e39c11ff461cda41191f134a6c7ff2b57f51762d3";
      };
    }
