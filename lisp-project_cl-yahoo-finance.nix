
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-yahoo-finance-20130312-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-yahoo-finance/2013-03-12/cl-yahoo-finance-20130312-git.tgz";
        sha256 = "10e63cd4dbba12f7f4aa354d019ad3b8a3bcd6b604508c361fc39e2cefd15f68";
      };
    }
