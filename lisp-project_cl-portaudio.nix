
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-portaudio-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-portaudio/2016-12-04/cl-portaudio-20161204-git.tgz";
        sha256 = "42b440a417fd0e7dd42384333ee57162d5d41e4e2009b95bd8cd730ae39162d2";
      };
    }
