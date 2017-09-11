
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_nst-4.1.0";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/nst/2016-03-18/nst-4.1.0.tgz";
        sha256 = "8cca381c6ed4de80c11db23435757014b53cce4b294826675e43a31bb07d6838";
      };
    }
