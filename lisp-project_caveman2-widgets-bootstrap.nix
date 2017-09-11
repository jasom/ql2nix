
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_caveman2-widgets-bootstrap-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/caveman2-widgets-bootstrap/2017-06-30/caveman2-widgets-bootstrap-20170630-git.tgz";
        sha256 = "4add543d5b1f9ad4f72c3ebfd2319c314fa3bf929a008ae631132156a210d6ed";
      };
    }
