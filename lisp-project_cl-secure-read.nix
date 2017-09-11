
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-secure-read-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-secure-read/2017-04-03/cl-secure-read-20170403-git.tgz";
        sha256 = "7cf9ff02c260fa6d48cc9b5907607d7e0698b7dc44beaa16e230296695f0d826";
      };
    }
