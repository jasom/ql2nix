
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_maxpc-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/maxpc/2017-02-27/maxpc-20170227-git.tgz";
        sha256 = "44f5de8dd63b24f8198334486399e757fd7f2a26d5c741df6d08b9487525de45";
      };
    }
