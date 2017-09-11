
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clod-20141217-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clod/2014-12-17/clod-20141217-hg.tgz";
        sha256 = "37276d3ebbaaabbf37f44adf00096b47f9976721cdc2296d449dba357aa40616";
      };
    }
