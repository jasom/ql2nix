
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-html-parse-20161031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-html-parse/2016-10-31/cl-html-parse-20161031-git.tgz";
        sha256 = "cb2e89e77c684ad540a78f27451276ba508869c60e364f3dce86a60b86a11644";
      };
    }
