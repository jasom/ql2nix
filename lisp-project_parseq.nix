
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_parseq-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/parseq/2017-08-30/parseq-20170830-git.tgz";
        sha256 = "abc442e8d7a2e7540171ef8ab964f6f2f3df4bd8aa5d4018bfd799efbca9f265";
      };
    }
