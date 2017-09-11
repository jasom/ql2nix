
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_moptilities-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/moptilities/2017-04-03/moptilities-20170403-git.tgz";
        sha256 = "08137c64e3c924827a6ae6b9bd21bed60d7d5771415c8a97b78352603a0fe02b";
      };
    }
