
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_s-http-server-20130128-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/s-http-server/2013-01-28/s-http-server-20130128-git.tgz";
        sha256 = "7ea44c977c31ecb7deff46abb83ee4e351dc76512b093250568287068bafd209";
      };
    }
