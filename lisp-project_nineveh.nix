
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_nineveh-release-quicklisp-06899fb4-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/nineveh/2017-08-30/nineveh-release-quicklisp-06899fb4-git.tgz";
        sha256 = "4b5a7293d5aa6156d28dd88589b9f0bd9e99ab3743116c99e4bb7f9f26de7d8d";
      };
    }
