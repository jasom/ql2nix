
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clunit-20130312-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clunit/2013-03-12/clunit-20130312-git.tgz";
        sha256 = "de72290a76db895281875468d51fd2cdb00116ec43796de15ef7e056dc3c8fa2";
      };
    }
