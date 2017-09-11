
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_pg-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/pg/2015-06-08/pg-20150608-git.tgz";
        sha256 = "0c615340e2293dcb863ea4421091b1e4559e2796d12036a0b7fc9dc454d7aadf";
      };
    }
