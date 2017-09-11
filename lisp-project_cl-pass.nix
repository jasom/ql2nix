
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-pass-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-pass/2017-06-30/cl-pass-20170630-git.tgz";
        sha256 = "dfe6a0b930c51c58161428251b10f0fd5de7e61a651200c8f91c82e918672df3";
      };
    }
