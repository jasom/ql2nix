
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ryeboy-20150302-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ryeboy/2015-03-02/ryeboy-20150302-git.tgz";
        sha256 = "05439ee09f5ab2cddbb6af99715c1a7113733e98985d29060a6ee502e127173c";
      };
    }
