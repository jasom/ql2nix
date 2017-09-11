
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_multiple-value-variants-1.0.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/multiple-value-variants/2014-08-26/multiple-value-variants-1.0.1.tgz";
        sha256 = "edab8238368c665f20a6fdc2147906b055849fd9876525b3baba62d86a0c1768";
      };
    }
