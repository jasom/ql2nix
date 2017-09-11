
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_parseltongue-20130312-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/parseltongue/2013-03-12/parseltongue-20130312-git.tgz";
        sha256 = "34129523bd90a9c03d92c0a0a0223e857e9d9dacde7e228b9675a64db27b0b5d";
      };
    }
