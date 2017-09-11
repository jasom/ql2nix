
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_babel-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/babel/2017-06-30/babel-20170630-git.tgz";
        sha256 = "9d0277f5b93012dd8db4e2288e28cfcb3fc3365022d3fb76fabf4c3adb773270";
      };
    }
