
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_make-hash-20130615-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/make-hash/2013-06-15/make-hash-20130615-git.tgz";
        sha256 = "7c2e69915df0050d477417ed1ef4da1ef1624c3b30b2d0b7766bfe0825f60cbe";
      };
    }
