
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_paren-test-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/paren-test/2017-08-30/paren-test-20170830-git.tgz";
        sha256 = "aa0f701b7d2ab1c99ef1a74298bdb3c2dd37ee078e0dc74fc86d7f6a070013b9";
      };
    }
