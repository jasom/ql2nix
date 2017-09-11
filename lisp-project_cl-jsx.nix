
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-jsx-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-jsx/2016-02-08/cl-jsx-20160208-git.tgz";
        sha256 = "b522f68b260f1258926d5c61841d35da8e9bfccc7003f90fa4a457cf14e0ba4b";
      };
    }
