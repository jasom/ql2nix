
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_read-csv-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/read-csv/2017-06-30/read-csv-20170630-git.tgz";
        sha256 = "f8e099d590cc6e20ef3e9402220e182d51df8ff73dde756d27ef4683dc162f5d";
      };
    }
