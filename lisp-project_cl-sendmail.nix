
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-sendmail-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-sendmail/2015-12-18/cl-sendmail-20151218-git.tgz";
        sha256 = "13988e1a8ba3530073b4545738c1b9dac21ffc983f6b1f720f9a09e5cd10a54c";
      };
    }
