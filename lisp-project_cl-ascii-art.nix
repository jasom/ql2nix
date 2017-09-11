
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-ascii-art-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-ascii-art/2017-06-30/cl-ascii-art-20170630-git.tgz";
        sha256 = "5670db07c3bf1553f57361a9130b69f50959b63837f558eeaa0a6286aaa8f1c3";
      };
    }
