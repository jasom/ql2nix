
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-fsnotify-20150302-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-fsnotify/2015-03-02/cl-fsnotify-20150302-git.tgz";
        sha256 = "6f71b14f802a86f678d8ded941802edb1151420620d2088d8900660fffbc3073";
      };
    }
