
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-jpl-util-20151031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-jpl-util/2015-10-31/cl-jpl-util-20151031-git.tgz";
        sha256 = "fdc36a55f7e6ea382bb91d773b56d86720bd64bd6bba413170fae1fcaa727aa8";
      };
    }
