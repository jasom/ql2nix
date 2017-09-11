
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_js-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/js/2016-12-04/js-20161204-git.tgz";
        sha256 = "93696c9e555885595790c3f684123edf6cd2c921c70f4d0d7c5b4bbe75065278";
      };
    }
