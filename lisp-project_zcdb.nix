
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_zcdb-1.0.4";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/zcdb/2015-04-07/zcdb-1.0.4.tgz";
        sha256 = "b9cf9f46e10bfaad83dd2526ffdb179c824acd3fc64d1d18b2a09e4bc6437c25";
      };
    }
