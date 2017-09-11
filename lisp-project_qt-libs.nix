
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_qt-libs-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/qt-libs/2017-06-30/qt-libs-20170630-git.tgz";
        sha256 = "c21e36d91694ca8b24ef3fab765b2b36dfacb56ad56c39824ba7d619616a34a0";
      };
    }
