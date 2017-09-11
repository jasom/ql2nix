
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-svg-20150407-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-svg/2015-04-07/cl-svg-20150407-git.tgz";
        sha256 = "598e112d874877b1e7c172f667c2db6394484807b2b0928c2467358e77cef75a";
      };
    }
