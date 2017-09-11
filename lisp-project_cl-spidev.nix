
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-spidev-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-spidev/2017-06-30/cl-spidev-20170630-git.tgz";
        sha256 = "e9c365015d4264952d020cc8dd7e8f7286637f758dd1a01bc09b85d53b109678";
      };
    }
