
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-ssl-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl+ssl/2017-07-25/cl+ssl-20170725-git.tgz";
        sha256 = "c9c8202fd46972a24001dc36ac345a0384c7b5d4b722df855ce4f355a841a8dc";
      };
    }
