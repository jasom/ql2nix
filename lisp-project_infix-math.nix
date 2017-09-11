
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_infix-math-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/infix-math/2017-07-25/infix-math-20170725-git.tgz";
        sha256 = "1a5de177713a58261624a83af787d3a8c179b8879d13e1b316162a9189723fac";
      };
    }
