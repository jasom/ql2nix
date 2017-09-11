
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-mpi-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-mpi/2016-08-25/cl-mpi-20160825-git.tgz";
        sha256 = "626e457420b65e405be8a843433bb7706a98edff35ba83eafe9d3c420a211f94";
      };
    }
