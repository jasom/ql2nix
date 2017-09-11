
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_projectured-quicklisp-c1e554b1-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/projectured/2016-04-21/projectured-quicklisp-c1e554b1-git.tgz";
        sha256 = "0f73e88da905151334f846b7237d85208faf88b3927defe0ffc3527e181ca496";
      };
    }
