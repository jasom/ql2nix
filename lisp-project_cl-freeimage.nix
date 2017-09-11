
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-freeimage-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-freeimage/2017-04-03/cl-freeimage-20170403-git.tgz";
        sha256 = "c5687cdca18c91f1e9b76d5e1bcef26918f364d98498e7ad82605ce182067e32";
      };
    }
