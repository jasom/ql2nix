
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_north-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/north/2017-06-30/north-20170630-git.tgz";
        sha256 = "a7ee61292010eedc3423cb3bac90f6e0fd7346ed9c40ead8e362df004670fca3";
      };
    }
