
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_metacopy-20170403-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/metacopy/2017-04-03/metacopy-20170403-darcs.tgz";
        sha256 = "5998c8c4d7ea68be8fd463158232e72374e308e0bffc2912759a47a87e71e525";
      };
    }
