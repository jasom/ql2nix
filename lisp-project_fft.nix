
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fft-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fft/2015-06-08/fft-20150608-git.tgz";
        sha256 = "07a284e881d0fa61e3ececc552f01e8dd34f972a56bfd910a4f9ed1713a6ce15";
      };
    }
