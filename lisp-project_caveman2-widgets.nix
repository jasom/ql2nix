
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_caveman2-widgets-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/caveman2-widgets/2017-06-30/caveman2-widgets-20170630-git.tgz";
        sha256 = "a360223f082ce634a4cc82e0ad20558c46abeb990a04aca1315ff1d0da5308d8";
      };
    }
