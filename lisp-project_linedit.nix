
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_linedit-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/linedit/2015-07-09/linedit-20150709-git.tgz";
        sha256 = "f01d64dec028303fa25672c1e7e5c05d6cb6f395f7578de322ee527980a52f70";
      };
    }
