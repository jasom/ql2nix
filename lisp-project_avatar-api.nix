
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_avatar-api-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/avatar-api/2015-06-08/avatar-api-20150608-git.tgz";
        sha256 = "72953776a32a8fac437322b43caf064144ccecf6f79350ec6bfd6d21c8030f06";
      };
    }
