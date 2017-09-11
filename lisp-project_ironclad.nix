
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ironclad-v0.34";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ironclad/2017-06-30/ironclad-v0.34.tgz";
        sha256 = "60f6e6fdd1120f2badee65b9d3d465bd01b3c0eac439459406797d78f4b7b423";
      };
    }
