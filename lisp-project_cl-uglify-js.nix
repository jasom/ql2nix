
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-uglify-js-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-uglify-js/2015-07-09/cl-uglify-js-20150709-git.tgz";
        sha256 = "3555e9e1cd50c02e98b9bb13ce442b9befcf08d863e508a25f70e63fcf916ac5";
      };
    }
