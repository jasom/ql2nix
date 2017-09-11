
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-httpsqs-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-httpsqs/2017-02-27/cl-httpsqs-20170227-git.tgz";
        sha256 = "c0a98292b7ca7bd06b7f26eff8917f649f7bd835b5da1d54e438e940b3469497";
      };
    }
