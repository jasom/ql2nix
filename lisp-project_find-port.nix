
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_find-port-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/find-port/2015-12-18/find-port-20151218-git.tgz";
        sha256 = "0bf9d19f53118d7aa8dd2b4e4097aaa293eded44ac9c5eb1b46f4fc6c9f5b4d6";
      };
    }
