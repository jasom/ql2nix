
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-fam-20121125-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-fam/2012-11-25/cl-fam-20121125-git.tgz";
        sha256 = "7ee6ffd439d9e5be891acb84212c0b9c57f5e7e26e2ce9cbbd763f66c536d4d5";
      };
    }
