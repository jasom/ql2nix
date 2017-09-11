
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_meta-sexp-0.1.6";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/meta-sexp/2010-10-06/meta-sexp-0.1.6.tgz";
        sha256 = "f732166a6bfb1bec839fabb170b0b5ac35898a26cedd556ea3791a025438c828";
      };
    }
