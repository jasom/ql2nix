
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-wayland-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-wayland/2017-01-24/cl-wayland-20170124-git.tgz";
        sha256 = "844443e687f90df6269797e23e1295be7f08c9bbbbdc8708ea282e3155f2406b";
      };
    }
