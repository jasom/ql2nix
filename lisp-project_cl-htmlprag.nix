
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-htmlprag-20160628-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-htmlprag/2016-06-28/cl-htmlprag-20160628-git.tgz";
        sha256 = "6677187135c3de08d2da45e2d084939a931891e8e7e4984b3c3baacd15dfe5b1";
      };
    }
