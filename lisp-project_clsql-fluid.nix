
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clsql-fluid-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clsql-fluid/2017-07-25/clsql-fluid-20170725-git.tgz";
        sha256 = "0cf34c7e0adafdb12bd1ff438e47579d2f4f531b79cfd227ddf322fd48fe7f1b";
      };
    }
