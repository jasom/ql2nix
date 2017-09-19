
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clonsigna-20120909-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clonsigna/2012-09-09/clonsigna-20120909-git.tgz";
        sha256 = "212bf00f48a51fe07629e149a2f24eabe20dd21c3e076fa0b23dde57a88598cc";
      };
    }
