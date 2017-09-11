
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_laap-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/laap/2017-07-25/laap-20170725-git.tgz";
        sha256 = "c093de753ab52df54f279de9482aacce0039edd83065afea22b2202c72c1e01d";
      };
    }
