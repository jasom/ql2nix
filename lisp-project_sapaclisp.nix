
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_sapaclisp-1.0a";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/sapaclisp/2012-05-20/sapaclisp-1.0a.tgz";
        sha256 = "afcf1d3ee845d808240237a48ff9b072bfa9d1f784fe3b0b9a610ab23487c8ef";
      };
    }
