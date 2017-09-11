
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_quickapp-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/quickapp/2016-08-25/quickapp-20160825-git.tgz";
        sha256 = "b0f81adbb6a4f63a2ef74b68e3dd9ceb3cf7b7ee0ae76049ea95b9e2c6dd4009";
      };
    }
