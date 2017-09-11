
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-syntax-20150407-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-syntax/2015-04-07/cl-syntax-20150407-git.tgz";
        sha256 = "166d32aaf0ed2a218926a1b757abb5c0edbac6fa493f5cba1a89501ce151e9df";
      };
    }
