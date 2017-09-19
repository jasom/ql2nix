
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_unit-formula-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/unit-formula/2017-08-30/unit-formula-20170830-git.tgz";
        sha256 = "e431192e0d94c354df20b339bc13031153c94e696c285e52c77d3282c12fc55b";
      };
    }
