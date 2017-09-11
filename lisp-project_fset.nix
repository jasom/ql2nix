
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fset-20150113-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fset/2015-01-13/fset-20150113-git.tgz";
        sha256 = "80eaa2318472a35a617a968bccb4125ef62f81358935d3e1271171a824222ccd";
      };
    }
