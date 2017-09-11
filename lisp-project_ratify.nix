
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ratify-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ratify/2017-07-25/ratify-20170725-git.tgz";
        sha256 = "7c4c3f012d76d33b1d497690bafe1e5671f9e904cddb4ecb2a9556e512ff0b57";
      };
    }
