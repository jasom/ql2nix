
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_gzip-stream_0.2.8";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/gzip-stream/2010-10-06/gzip-stream_0.2.8.tgz";
        sha256 = "3637b788cfbdd4db3a16cecc28fe097814a3a68c11e31b53bc3210de86d2a3bb";
      };
    }
