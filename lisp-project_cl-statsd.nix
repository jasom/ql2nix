
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-statsd-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-statsd/2017-01-24/cl-statsd-20170124-git.tgz";
        sha256 = "6f2f588b0cb7a2d4137c07a7ea90241d4c1a51a8cd32bd7956db9bf6a878995f";
      };
    }
