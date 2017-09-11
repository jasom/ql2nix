
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-olefs-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-olefs/2015-07-09/cl-olefs-20150709-git.tgz";
        sha256 = "ea8fba93131ef8bb4e9e024d4e07c09ff352b8d9a633d56c67186cb0a35e8f97";
      };
    }
