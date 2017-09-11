
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-markdown-20101006-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-markdown/2010-10-06/cl-markdown-20101006-darcs.tgz";
        sha256 = "3c1da678be4f7ee71c245fafa56c1b6f4d3e49e7c6d5cc9b5aafc30abf3e3bc3";
      };
    }
