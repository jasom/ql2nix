
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_climc-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/climc/2015-09-23/climc-20150923-git.tgz";
        sha256 = "be9e5ba9a4ebfd8911cd748db46caf0e711eae1fed2a6d656688d82734c38b82";
      };
    }
