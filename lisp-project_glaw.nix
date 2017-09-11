
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_glaw-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/glaw/2017-06-30/glaw-20170630-git.tgz";
        sha256 = "aac6ce3390cd9737cdfdba6c483de0be5fcb15140cff1000ca4ea31defd089d3";
      };
    }
