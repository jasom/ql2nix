
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_texp-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/texp/2015-12-18/texp-20151218-git.tgz";
        sha256 = "efa98e19696b7c391c19b1c58fbc3f8a28663fe6d82ec76044c6370c358edcb3";
      };
    }
