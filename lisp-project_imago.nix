
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_imago-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/imago/2015-06-08/imago-20150608-git.tgz";
        sha256 = "2c9e12102d0edae6f8583f90423e1d081bdcdb16de6b8c965c4a19aa3922120e";
      };
    }
