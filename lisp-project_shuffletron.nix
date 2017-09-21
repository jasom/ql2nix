
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_shuffletron-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/shuffletron/2015-06-08/shuffletron-20150608-git.tgz";
        sha256 = "8a73f303c00e45f6f806c41705b5c8b61b721006f95883594b1ef31e1a681ee9";
      };
    }
