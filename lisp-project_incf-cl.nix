
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_incf-cl-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/incf-cl/2016-02-08/incf-cl-20160208-git.tgz";
        sha256 = "5f124aadf89db4a11183b4705596f6a41e98c95a310364204749359fa3cd8dbb";
      };
    }
