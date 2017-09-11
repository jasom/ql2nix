
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-msi-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-msi/2016-02-08/trivial-msi-20160208-git.tgz";
        sha256 = "ae16dfcfd07a03725ba87734fd28a48b8a675ee73370a3e3575cb92c6cca2e28";
      };
    }
