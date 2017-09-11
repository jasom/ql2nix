
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-marklogic-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-marklogic/2017-04-03/cl-marklogic-20170403-git.tgz";
        sha256 = "1d4ffed610c3d13767c84c0a5a73ef832037d2ee5d2715f62a0a2b88125be07f";
      };
    }
