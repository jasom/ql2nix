
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-randist-20150113-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-randist/2015-01-13/cl-randist-20150113-git.tgz";
        sha256 = "9ac7f80c97430a69addeebad1f4879245a3865a6966a22932591e9e948f56bf6";
      };
    }
