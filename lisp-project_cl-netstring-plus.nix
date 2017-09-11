
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-netstring-plus-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-netstring-plus/2015-07-09/cl-netstring-plus-20150709-git.tgz";
        sha256 = "4b2349b7ca4ecb6f7f6c41d37c4e1b6a9a2ad34c00e6841a655a0cde8a6c7815";
      };
    }
