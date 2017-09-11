
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-dot-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-dot/2016-12-04/cl-dot-20161204-git.tgz";
        sha256 = "bcf9d566565e4af1f7b229083d92359abe55919413c931c0538282936522e8b5";
      };
    }
