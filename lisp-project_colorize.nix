
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_colorize-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/colorize/2017-06-30/colorize-20170630-git.tgz";
        sha256 = "791a052747050ac42f674df3a99698d65b5663b5b0ef1756548524fc7338ce9a";
      };
    }
