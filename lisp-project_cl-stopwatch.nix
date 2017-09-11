
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-stopwatch-20120407-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-stopwatch/2012-04-07/cl-stopwatch-20120407-hg.tgz";
        sha256 = "43aeba283d97eaabc927befb512d547a23385a4beacac7ec703af0014542554a";
      };
    }
