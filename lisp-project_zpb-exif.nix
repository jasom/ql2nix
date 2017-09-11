
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_zpb-exif-1.2.3";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/zpb-exif/2015-04-07/zpb-exif-1.2.3.tgz";
        sha256 = "521c44f1654091ace5f5af8d7fd4122e8558649f11042abe13844c643634e3fa";
      };
    }
