
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_bordeaux-fft-20150608-http";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/bordeaux-fft/2015-06-08/bordeaux-fft-20150608-http.tgz";
        sha256 = "19fbdb364d340fb9eab738b499da8e2c124533086098d7d93d2fc5fc01ee5d70";
      };
    }
