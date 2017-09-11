
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_s-base64-20130128-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/s-base64/2013-01-28/s-base64-20130128-git.tgz";
        sha256 = "35340d588da1cd58db34188e513c274ef2e048252d0c39db62292a76b550854d";
      };
    }
