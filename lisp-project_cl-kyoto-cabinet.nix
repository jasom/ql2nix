
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-kyoto-cabinet-20120520-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-kyoto-cabinet/2012-05-20/cl-kyoto-cabinet-20120520-git.tgz";
        sha256 = "7b87dc6d17253e1b143b8a0b0e42860c505cdd54c44134d3499e21e3e8325f22";
      };
    }
