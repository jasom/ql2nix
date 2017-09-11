
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_monkeylib-pathnames-20120208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/monkeylib-pathnames/2012-02-08/monkeylib-pathnames-20120208-git.tgz";
        sha256 = "4c447e95089d1be56f590c2f3d6e41ffca29b1c459d77e57580be056c5116c1c";
      };
    }
