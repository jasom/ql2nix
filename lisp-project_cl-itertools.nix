
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-itertools-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-itertools/2016-04-21/cl-itertools-20160421-git.tgz";
        sha256 = "8df3fe17f1e88404c1e85cdc027cb60f0ba8b17f3939e740d9ba520ecd17c2fb";
      };
    }
