
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-xul-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-xul/2016-03-18/cl-xul-20160318-git.tgz";
        sha256 = "0377c2c829a5ca6a246c416634bea5df164ed32e6e8363ad8c125c66da44e797";
      };
    }
