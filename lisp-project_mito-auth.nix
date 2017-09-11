
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_mito-auth-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/mito-auth/2017-07-25/mito-auth-20170725-git.tgz";
        sha256 = "5a3c9da69d392801245bb111d2f8888a0d10cedb835c8dbf4991e33efd8bb0fa";
      };
    }
