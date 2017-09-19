
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lol-re-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lol-re/2017-04-03/lol-re-20170403-git.tgz";
        sha256 = "12852bfc795fa93e50bfb994efc9de23be40cfae521195919e4ffd340253ea5b";
      };
    }
