
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_infix-dollar-reader-20121013-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/infix-dollar-reader/2012-10-13/infix-dollar-reader-20121013-git.tgz";
        sha256 = "265782e70bdedf0debea6b10e2f3c2584b92ddf7b5b6adab9d0b3d437585625b";
      };
    }
