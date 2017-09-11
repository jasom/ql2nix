
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_skippy-1.3.12";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/skippy/2015-04-07/skippy-1.3.12.tgz";
        sha256 = "59bc1ca8204858419f6cf24a55ed26e06f50a60f9decddbe6d3dc970cbae729c";
      };
    }
