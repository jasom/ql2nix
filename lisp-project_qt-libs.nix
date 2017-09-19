
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_qt-libs-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/qt-libs/2017-08-30/qt-libs-20170830-git.tgz";
        sha256 = "d5fde0444b8a1c89de94e926375d8bd3cdd18f140e3f78b10b1b1069fd53b90a";
      };
    }
