
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lass-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lass/2017-06-30/lass-20170630-git.tgz";
        sha256 = "839ec94054bb4fbd673136c53ecaf8e767379d01d9585ceee0044e6986562ead";
      };
    }
