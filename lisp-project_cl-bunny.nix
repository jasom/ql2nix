
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-bunny-0.4.5";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-bunny/2016-03-18/cl-bunny-0.4.5.tgz";
        sha256 = "7f46a7ec95f6e8827b1029c14e5b0a2d344def715e10ee957ae79397bb841122";
      };
    }
