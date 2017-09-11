
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-html-diff-20130128-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-html-diff/2013-01-28/cl-html-diff-20130128-git.tgz";
        sha256 = "91cd589bb1302fafb3eb6d6ebd80dc99895609405232eb429ab46241dd737835";
      };
    }
