
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_plump-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/plump/2017-07-25/plump-20170725-git.tgz";
        sha256 = "e2e86479de6d3515a1a87b24ac820b5331fcff9c123b14a63126621d3cd40a85";
      };
    }
