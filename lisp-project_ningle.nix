
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ningle-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ningle/2017-07-25/ningle-20170725-git.tgz";
        sha256 = "6ae6eb2677cc05f61ecb351a54b90afedffd18bda10c0a3e51276880d32dcc4f";
      };
    }
