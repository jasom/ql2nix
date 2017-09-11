
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-string-complete-20120107-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-string-complete/2012-01-07/cl-string-complete-20120107-hg.tgz";
        sha256 = "2888fdc698966803cced9960c10a22807b8883b7e7b6f339f072fdc91817f59b";
      };
    }
