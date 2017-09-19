
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_beirc-20150505-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/beirc/2015-05-05/beirc-20150505-git.tgz";
        sha256 = "b369032b0f7b0221602ff9e6ae7388e30f7ef30a4c6e8eaffc024664e0116fa7";
      };
    }
