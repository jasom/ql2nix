
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_checkl-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/checkl/2017-08-30/checkl-20170830-git.tgz";
        sha256 = "17be612981ea1753a3e1af0340f571bea84a617bfb1ea493078316d775b849c1";
      };
    }
