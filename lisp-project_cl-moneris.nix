
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-moneris-20110418-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-moneris/2011-04-18/cl-moneris-20110418-git.tgz";
        sha256 = "b303682cf64e6034d52a648579d3b62c940d1b0ee24f62c905c93b44fad84438";
      };
    }
