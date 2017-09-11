
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_glyphs-20150804-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/glyphs/2015-08-04/glyphs-20150804-git.tgz";
        sha256 = "e6c7d2e6339214b1a9f6f5c9fb8ac5095b8fe894d272edff76a64990105e1cd3";
      };
    }
