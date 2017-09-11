
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ia-hash-table-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ia-hash-table/2016-03-18/ia-hash-table-20160318-git.tgz";
        sha256 = "e6040b93fba4622fe53f9e723eabd38a435906a5fa3980237d8156e7fe3bce37";
      };
    }
