
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_torta-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/torta/2014-07-13/torta-20140713-git.tgz";
        sha256 = "a62e043e06026f3044f717b3323d64f5103cea41d3d7eacf59bfeb3df5f8e493";
      };
    }
