
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-match-20121125-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-match/2012-11-25/cl-match-20121125-git.tgz";
        sha256 = "fe2d9423f79740632496f0745dc37757b04fc760f110b7d9512580b312fe95ca";
      };
    }
