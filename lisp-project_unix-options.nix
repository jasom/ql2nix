
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_unix-options-20151031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/unix-options/2015-10-31/unix-options-20151031-git.tgz";
        sha256 = "a531ccf1886c6c273b4be269cdd95cb32d26fb7f449883b4dd1c97eef75e3b31";
      };
    }
