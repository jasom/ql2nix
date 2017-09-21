
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_moira-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/moira/2017-02-27/moira-20170227-git.tgz";
        sha256 = "f3bb013c10b0dec813889cdc477ac2f983402d505cd64eed5024955954d02a80";
      };
    }
