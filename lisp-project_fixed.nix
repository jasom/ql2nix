
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fixed-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fixed/2017-01-24/fixed-20170124-git.tgz";
        sha256 = "91fe3cbaa03a1e2dfbc9d4287bbff3cd6d7b7e7da92059551ff756370fac42c8";
      };
    }
