
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-libyaml-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-libyaml/2017-01-24/cl-libyaml-20170124-git.tgz";
        sha256 = "7dc6fa04da7e8db1593ca7f78c8038562bfc1a50007f8e3357ee158cd419c5d2";
      };
    }
