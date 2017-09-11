
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [./patches/lisp-project_cl-heredoc-20101006-git.in-package.patch];
      name = "lisp-project_cl-heredoc-20101006-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-heredoc/2010-10-06/cl-heredoc-20101006-git.tgz";
        sha256 = "f6893f8d5aa519951d91e0d2e0d7e0b2575559617085adc6581a52d2a8f8258a";
      };
    }
