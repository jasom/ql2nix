
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [./patches/lisp-project_cl-performance-tuning-helper-20130615-git.in-package.patch];
      name = "lisp-project_cl-performance-tuning-helper-20130615-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-performance-tuning-helper/2013-06-15/cl-performance-tuning-helper-20130615-git.tgz";
        sha256 = "b09a4bfac272ffe857d02e7441e28acde0ed1f2e2e502abcb67633678e61fd12";
      };
    }
