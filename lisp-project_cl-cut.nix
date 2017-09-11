
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-cut-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-cut/2016-02-08/cl-cut-20160208-git.tgz";
        sha256 = "ac345b6556b5717da239856a5f0829fe6cab8da6298cf252dc1bc41ed271fc22";
      };
    }
