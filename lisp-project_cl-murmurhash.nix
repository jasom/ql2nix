
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-murmurhash-20150804-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-murmurhash/2015-08-04/cl-murmurhash-20150804-git.tgz";
        sha256 = "01444642edf7976addfc6d7c3cd51fae5e499e1da073a53bb3511ba4dd1cbc22";
      };
    }
