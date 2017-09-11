
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-template-20130615-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-template/2013-06-15/cl-template-20130615-git.tgz";
        sha256 = "7075d676a3aa8fa395a5c176d92e5af5905855ec6865414f7d9defce2e3a9eda";
      };
    }
