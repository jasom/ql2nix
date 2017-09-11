
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clouchdb_0.0.16";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clouchdb/2012-04-07/clouchdb_0.0.16.tgz";
        sha256 = "214da35b4e6a8f95fd7857b7483341c0266764bcda661e3a52fff9dc6d6978e5";
      };
    }
