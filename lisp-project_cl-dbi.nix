
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-dbi-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-dbi/2017-07-25/cl-dbi-20170725-git.tgz";
        sha256 = "f4e36cffb7f18d4b7593af801d9c6475d05709ed15cc7f78afb8454b882fadbe";
      };
    }
