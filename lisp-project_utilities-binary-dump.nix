
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_utilities-binary-dump-20161031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/utilities.binary-dump/2016-10-31/utilities.binary-dump-20161031-git.tgz";
        sha256 = "e1af61804b12c919c0c915655299e59697d50db91adafd32be8e31e3c8721dca";
      };
    }
