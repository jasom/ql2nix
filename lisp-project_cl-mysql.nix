
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-mysql-20160628-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-mysql/2016-06-28/cl-mysql-20160628-git.tgz";
        sha256 = "298c0116812e9948f7c25a72b6d6e1d2e408520163cb645b48cc92c1ad9271fe";
      };
    }
