
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-forms-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-forms/2017-08-30/cl-forms-20170830-git.tgz";
        sha256 = "4e52cf1879b8dd88388f8969b8cd614704ca0b862f4b5386354bfe9d88a5d7d6";
      };
    }
