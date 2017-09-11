
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-proj-20150804-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-proj/2015-08-04/cl-proj-20150804-hg.tgz";
        sha256 = "9b1ce76af5d9fd6ac73faf7a25fbac20533f8d86a9cc7d1694444bd8d8eb5168";
      };
    }
