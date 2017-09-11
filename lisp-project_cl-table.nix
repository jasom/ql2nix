
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-table-20130128-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-table/2013-01-28/cl-table-20130128-git.tgz";
        sha256 = "e4da0a10ac6ee0764cc02607280240c98de99f5c418a97013749ac18982cad40";
      };
    }
