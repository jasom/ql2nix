
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_userial_0.8.2011.06.02";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/userial/2011-06-19/userial_0.8.2011.06.02.tgz";
        sha256 = "65ac15a1f2f9749023d586fd9e553925aa106ed4c007f42c150de61d9ae3d4c0";
      };
    }
