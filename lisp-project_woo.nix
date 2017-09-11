
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_woo-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/woo/2017-07-25/woo-20170725-git.tgz";
        sha256 = "ef398c8e829783ad62f9670bb3484e821c645a5d3bea7bfb9b50565440c39685";
      };
    }
