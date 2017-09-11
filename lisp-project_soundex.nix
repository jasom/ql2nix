
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_soundex-1.0";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/soundex/2010-10-06/soundex-1.0.tgz";
        sha256 = "3d7fd73f42b63cee2a7d9dd4677122c01bbb7611e7fff725a388386be4f64c5f";
      };
    }
