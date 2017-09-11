
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_oook-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/oook/2017-07-25/oook-20170725-git.tgz";
        sha256 = "93e950923b3b0dfd6e87024877a03f9a6f4ace9b1ebb2eff1c5da9fc2a7ce733";
      };
    }
