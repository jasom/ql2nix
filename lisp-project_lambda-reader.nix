
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lambda-reader-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lambda-reader/2017-01-24/lambda-reader-20170124-git.tgz";
        sha256 = "ada5c6f000a1d603e523d1a81f0fb00d6d0621e8498b4cb5bcc3d64f6c0db7e4";
      };
    }
