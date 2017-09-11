
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_macro-level-1.0.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/macro-level/2012-10-13/macro-level-1.0.1.tgz";
        sha256 = "ca6e52fd1e507e4466bed45939ac50dff55cb0019d29c1dcb37707192f31bc53";
      };
    }
