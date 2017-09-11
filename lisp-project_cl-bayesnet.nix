
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-bayesnet-20130420-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-bayesnet/2013-04-20/cl-bayesnet-20130420-git.tgz";
        sha256 = "06d98ae9adaa9c8a7cdfa25d74876dc8c7b7d4c18fadece98a9c4e9959b02c26";
      };
    }
