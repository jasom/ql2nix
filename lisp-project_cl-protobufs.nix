
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-protobufs-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-protobufs/2017-04-03/cl-protobufs-20170403-git.tgz";
        sha256 = "e5113e8aa25794abe41a9df2127fcf13c3e2e4af263da6743af8a1690ea07745";
      };
    }
