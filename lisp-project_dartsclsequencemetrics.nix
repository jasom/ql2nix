
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_dartsclsequencemetrics-20130312-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/dartsclsequencemetrics/2013-03-12/dartsclsequencemetrics-20130312-git.tgz";
        sha256 = "903d78947a54e731bf3e50db622d23c8c86312ff6e54bb780f66ecb4be91541d";
      };
    }
