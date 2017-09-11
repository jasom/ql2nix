
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_sanitized-params-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/sanitized-params/2017-07-25/sanitized-params-20170725-git.tgz";
        sha256 = "33e7b622f461205052bacc19faf7cf075231cf8da7f884163c07fd76aac52d13";
      };
    }
