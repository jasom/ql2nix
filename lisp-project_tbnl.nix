
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_tbnl-0.11.4";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/tbnl/2010-10-06/tbnl-0.11.4.tgz";
        sha256 = "69916492c65f9746812aa27ebb7ca82b099aebfb117c654d9dba108df24730c5";
      };
    }
