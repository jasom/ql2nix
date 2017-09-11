
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-hamt-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-hamt/2017-01-24/cl-hamt-20170124-git.tgz";
        sha256 = "bf14bd6e1c64c1ba0f25b55f4309a5406a4f52f1b2a9da420b264ac06845f4d9";
      };
    }
