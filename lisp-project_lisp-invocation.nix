
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lisp-invocation-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lisp-invocation/2017-02-27/lisp-invocation-20170227-git.tgz";
        sha256 = "7521572814194eb0358f719f31c5db3dc8f5dae270fe7a92e9a9f199d7db7399";
      };
    }
