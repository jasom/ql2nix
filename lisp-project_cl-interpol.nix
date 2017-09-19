
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-interpol-0.2.6";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-interpol/2016-09-29/cl-interpol-0.2.6.tgz";
        sha256 = "0bc1d45179d4295ee25a012558f7fd167724c9c74b1a7b3e74be3b7217f1519c";
      };
    }
