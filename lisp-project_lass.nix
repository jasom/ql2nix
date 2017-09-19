
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lass-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lass/2017-08-30/lass-20170830-git.tgz";
        sha256 = "653e77df2c3601f79137a6581b8b36f9643fd49802363ad5d18e00a0e837b913";
      };
    }
