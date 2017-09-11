
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_liblmdb-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/liblmdb/2017-02-27/liblmdb-20170227-git.tgz";
        sha256 = "d65a0ec589bf26b92085b7bf9468b493bad04f636471f02a68bd19f5b2a4d9e5";
      };
    }
