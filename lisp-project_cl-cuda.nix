
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-cuda-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-cuda/2017-04-03/cl-cuda-20170403-git.tgz";
        sha256 = "dcfe034831119ef9edee43b26e871f4b80fe7446bca91caa657aa14fc97ef797";
      };
    }
