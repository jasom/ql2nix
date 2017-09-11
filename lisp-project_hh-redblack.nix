
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hh-redblack-20151031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hh-redblack/2015-10-31/hh-redblack-20151031-git.tgz";
        sha256 = "4c318f6ae96dd8cb873300d022802c0c6f48653af98849376076b45735ba2cfa";
      };
    }
