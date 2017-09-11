
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_sb-vector-io-20110829-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/sb-vector-io/2011-08-29/sb-vector-io-20110829-git.tgz";
        sha256 = "861eec8b3fae1c35809cdceeb9f42644b8376f63eb1a1c780ad6e03e2f0e605c";
      };
    }
