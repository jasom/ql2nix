
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_leveldb-20160531-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/leveldb/2016-05-31/leveldb-20160531-git.tgz";
        sha256 = "5160a2f069e57224bc8b4b63ad630d44c5472772bdb35d5d2b4f2328435ef5f4";
      };
    }
