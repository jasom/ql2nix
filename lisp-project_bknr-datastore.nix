
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_bknr-datastore-20160929-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/bknr-datastore/2016-09-29/bknr-datastore-20160929-git.tgz";
        sha256 = "9f28109240b750477f1a5bafbc6ae4fad78d91ec5602b5513acbd3fa64ec3c10";
      };
    }
