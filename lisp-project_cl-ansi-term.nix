
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-ansi-term-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-ansi-term/2017-06-30/cl-ansi-term-20170630-git.tgz";
        sha256 = "2cedbeb1fdf7318ec525b8ae2154a84b350a08247ed30b35c79be1c2e2dfc586";
      };
    }
