
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_verbose-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/verbose/2017-08-30/verbose-20170830-git.tgz";
        sha256 = "5018e1f93915716e8ea684a7f02849d306151a943221c2fb377933e7e5b6f2b3";
      };
    }
