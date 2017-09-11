
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-bloom-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-bloom/2017-06-30/cl-bloom-20170630-git.tgz";
        sha256 = "4240484f83343524a2172f48aac3514daa2582ac72cfbf813798f659acd0db75";
      };
    }
