
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-libssh2-20160531-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-libssh2/2016-05-31/cl-libssh2-20160531-git.tgz";
        sha256 = "07401ab32e0506ca19d51f6ab62a277ba1a708b57fe01c5362d93adce8a5e4b6";
      };
    }
