
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_simple-logger-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/simple-logger/2017-08-30/simple-logger-20170830-git.tgz";
        sha256 = "efbe043358931ca32efc392144b99e88c99d7987f5452b88ec106dcc4f92e5ed";
      };
    }
