
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_dso-lex-0.3.2";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/dso-lex/2011-01-10/dso-lex-0.3.2.tgz";
        sha256 = "43d1680d67f827328828338488ede3d0d5607577e5fd6df1eee5cc4c065c5cff";
      };
    }
