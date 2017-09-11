
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-coveralls-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-coveralls/2015-12-18/cl-coveralls-20151218-git.tgz";
        sha256 = "c64ef21fbbdeae3bfc581fef0633d1b10f26de08927a76ac99068eae4922337d";
      };
    }
