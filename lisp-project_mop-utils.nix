
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_mop-utils-20120811-http";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/mop-utils/2012-08-11/mop-utils-20120811-http.tgz";
        sha256 = "9b2df772230de33f82155c03f7e3ed43c77cd1c7bafd37ae1e3d3fe16dc2fae9";
      };
    }
