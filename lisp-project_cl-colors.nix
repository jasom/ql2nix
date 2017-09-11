
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-colors-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-colors/2015-12-18/cl-colors-20151218-git.tgz";
        sha256 = "e462c64c094ac82faec161eccc4599ffe8e95ea5e0b5b0d13e2b0a682cd7530c";
      };
    }
