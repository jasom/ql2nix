
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_diff-20130813-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/diff/2013-08-13/diff-20130813-git.tgz";
        sha256 = "d9b2e1cbdce0339ad6ecfaa511145ae4c048a87b8a48dd3f63b5f2f6296320f0";
      };
    }
