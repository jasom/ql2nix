
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_py-configparser-20170725-svn";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/py-configparser/2017-07-25/py-configparser-20170725-svn.tgz";
        sha256 = "f99b2f8912f9aae99668d0cab614b13a8be3b48c674f30c725c562093d958e23";
      };
    }
