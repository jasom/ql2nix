
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cartesian-product-switch-2.0";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cartesian-product-switch/2012-09-09/cartesian-product-switch-2.0.tgz";
        sha256 = "8d41c97c2f72218645250beab23f264835446cdee513445e5c17102b7968613b";
      };
    }
