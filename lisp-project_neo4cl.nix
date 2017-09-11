
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_neo4cl-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/neo4cl/2017-06-30/neo4cl-20170630-git.tgz";
        sha256 = "3aa6e8a594a3f45c7df932e07a4f8b10d766b5d56f7b55f46b21243dc99a2688";
      };
    }
