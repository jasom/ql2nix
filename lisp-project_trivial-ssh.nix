
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-ssh-20151031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-ssh/2015-10-31/trivial-ssh-20151031-git.tgz";
        sha256 = "63ee25fca2bef68101a4d2cec8bc6775c14221ace1a9e28892768410409e2c9e";
      };
    }
