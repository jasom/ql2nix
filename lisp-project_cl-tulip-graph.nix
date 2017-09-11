
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-tulip-graph-20130615-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-tulip-graph/2013-06-15/cl-tulip-graph-20130615-git.tgz";
        sha256 = "e39f568280b0e6cb26c64aa9e6e69da078f197731210bec6cdc57478f878dd43";
      };
    }
