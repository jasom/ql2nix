
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-digraph-20170630-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-digraph/2017-06-30/cl-digraph-20170630-hg.tgz";
        sha256 = "912da44090f9bfab89873e689fbbc3b00dda623aff8f120b56395789b82f57ba";
      };
    }
