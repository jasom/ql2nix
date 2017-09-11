
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-ixf-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-ixf/2017-06-30/cl-ixf-20170630-git.tgz";
        sha256 = "c2d1cbc962c0e3136df4d7e1de65f304aa421fa1ad2fb0e3d1aaf945c7d7d5e1";
      };
    }
