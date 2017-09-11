
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_timer-wheel-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/timer-wheel/2017-02-27/timer-wheel-20170227-git.tgz";
        sha256 = "c521be4c85726f4b71f0e3a2b8d9077a12bda82f49f8ae3cffabaee85ad3d22e";
      };
    }
