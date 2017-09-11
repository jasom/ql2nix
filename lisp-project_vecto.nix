
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_vecto-1.4.10";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/vecto/2014-11-06/vecto-1.4.10.tgz";
        sha256 = "f7397fc278a7c0c6c7c43800c2240d3abc358ea64ea08438d024f8db2b511399";
      };
    }
