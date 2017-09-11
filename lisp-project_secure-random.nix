
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_secure-random-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/secure-random/2016-02-08/secure-random-20160208-git.tgz";
        sha256 = "0a5c7ce7625bec15051ed38243d2f419223b9e64796e590fd1373286467a2538";
      };
    }
