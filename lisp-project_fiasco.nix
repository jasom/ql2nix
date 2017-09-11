
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fiasco-20161031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fiasco/2016-10-31/fiasco-20161031-git.tgz";
        sha256 = "98ba9ea369fc05298e078c91131831f2a7966378918f9df1e7a40acdf822d6ad";
      };
    }
