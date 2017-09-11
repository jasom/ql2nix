
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-poker-eval-20150804-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-poker-eval/2015-08-04/cl-poker-eval-20150804-git.tgz";
        sha256 = "9ff2663ea84a3a2c52b33e3deffb9b643336e25e35f013f7a19d995963bb643d";
      };
    }
