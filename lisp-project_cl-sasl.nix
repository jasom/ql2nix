
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-sasl_0.3.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-sasl/2011-05-22/cl-sasl_0.3.1.tgz";
        sha256 = "1e15a81728aa63025c79c92f47d87f4852f3a619a0cdff7f89bdfa4dd7b0b6ce";
      };
    }
