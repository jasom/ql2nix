
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-gene-searcher-20111001-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-gene-searcher/2011-10-01/cl-gene-searcher-20111001-git.tgz";
        sha256 = "3e20fb4fc020e4c3a24a18ad39d08744ebbd7fc5d36cfa88ea5aefc556d33fbd";
      };
    }
