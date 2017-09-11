
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-s3-20130128-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-s3/2013-01-28/cl-s3-20130128-git.tgz";
        sha256 = "f811acc1a8b90d6c0ebe86a343be5c013091c3b558042164f24734ec54d430ef";
      };
    }
