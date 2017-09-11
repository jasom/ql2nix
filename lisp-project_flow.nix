
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_flow-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/flow/2017-06-30/flow-20170630-git.tgz";
        sha256 = "dc0eede300b07ceb5f4526f4152084baef4cc78654131b8c2a0dbf540104f5e7";
      };
    }
