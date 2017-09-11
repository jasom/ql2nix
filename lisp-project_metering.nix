
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_metering-20161208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/metering/2016-12-08/metering-20161208-git.tgz";
        sha256 = "24b8da2c0d52461bf271f53db738411d9273f769150e6d8bb9cc12bada465115";
      };
    }
