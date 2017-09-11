
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_com-google-base-20151031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/com.google.base/2015-10-31/com.google.base-20151031-git.tgz";
        sha256 = "81a062129c97309aabae26e3dcea815dc30d36b532b0ca5aca95c511a5f54465";
      };
    }
