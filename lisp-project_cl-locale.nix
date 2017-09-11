
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-locale-20151031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-locale/2015-10-31/cl-locale-20151031-git.tgz";
        sha256 = "ef4aab9dc41d307e6b74e380a3011574eb0954e62e47828964658b9ebfea4492";
      };
    }
