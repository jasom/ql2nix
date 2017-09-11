
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_salza2-2.0.9";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/salza2/2013-07-20/salza2-2.0.9.tgz";
        sha256 = "6aa36dc25fe2dfb411c03ad62edb39fcbf1d4ca8b45ba17a6ad20ebc9f9e10d4";
      };
    }
