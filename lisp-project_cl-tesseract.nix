
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-tesseract-20151031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-tesseract/2015-10-31/cl-tesseract-20151031-git.tgz";
        sha256 = "b02ae46566fcc993cb49791c327756f49845a341e9d4781edc0d32e1aaa8cbbe";
      };
    }
