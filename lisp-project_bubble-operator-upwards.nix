
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_bubble-operator-upwards-1.0";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/bubble-operator-upwards/2012-11-25/bubble-operator-upwards-1.0.tgz";
        sha256 = "83fbc2c5922532da6bff3ca807050db2522c0a1133e00445af7ccd6cfececeb1";
      };
    }
