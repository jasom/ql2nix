
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_plump-sexp-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/plump-sexp/2017-08-30/plump-sexp-20170830-git.tgz";
        sha256 = "793b105e75e6bbb03f5f21cfda00b19c6f03478040e806f0431c661bd51a655a";
      };
    }
