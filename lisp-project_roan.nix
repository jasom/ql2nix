
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_roan-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/roan/2017-07-25/roan-20170725-git.tgz";
        sha256 = "8490daa8ffd62f1442924953bffe47fd95c1a0da2fd154ad441b41f96ce8ac10";
      };
    }
