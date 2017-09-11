
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_psgraph-1.2";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/psgraph/2010-10-06/psgraph-1.2.tgz";
        sha256 = "5974b5b220e3913a7d971d32f73dba23e035cde8b650edd32ee8728a7eac00d8";
      };
    }
